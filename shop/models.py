from django.db import models
from django.db.models.deletion import DO_NOTHING
from django.utils import timezone


class category(models.Model):
    name = models.CharField(max_length=32)

    def __str__(self):
        return self.name


class brand(models.Model):
    name = models.CharField(max_length=32)

    def __str__(self):
        return self.name


class product(models.Model):
    category = models.ForeignKey(category, on_delete=DO_NOTHING)
    brand = models.ForeignKey(brand, on_delete=models.CASCADE)
    name = models.CharField(max_length=32)
    unit_price = models.FloatField()
    description = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.name


class product_specification(models.Model):
    COLOR = "color"
    SIZE = "size"
    groupChoices = [(COLOR, COLOR), (SIZE, SIZE)]
    product = models.ForeignKey(product, on_delete=models.CASCADE)
    group = models.CharField(max_length=32, choices=groupChoices)
    detail = models.CharField(max_length=64)

    def __str__(self):
        return "{} / {} / {}".format(self.product.name, self.group, self.detail)

    class Meta:
        unique_together = ["product", "group", "detail"]


class product_picture(models.Model):
    def path(instance, filename):
        return "product/{}_{}/{}".format(
            instance.product.name, instance.product.id, filename
        )

    product = models.ForeignKey(product, on_delete=models.CASCADE)
    specification = models.ForeignKey(product_specification, on_delete=DO_NOTHING)
    picture = models.ImageField(max_length=1024, upload_to=path)


class inventory(models.Model):
    product = models.ForeignKey(product, on_delete=models.CASCADE)
    color = models.ForeignKey(
        product_specification,
        on_delete=DO_NOTHING,
        limit_choices_to={"group": "color"},
        related_name="inventoty_of_this_color",
    )
    size = models.ForeignKey(
        product_specification,
        on_delete=DO_NOTHING,
        limit_choices_to={"group": "size"},
        related_name="inventoty_of_this_size",
    )
    inventory = models.PositiveIntegerField()
    quantity_sold = models.PositiveIntegerField()

    def __str__(self):
        return "{} ({}, {}): {}/{}".format(
            self.product.name,
            self.color.detail,
            self.size.detail,
            self.inventory,
            self.quantity_sold,
        )

    class Meta:
        unique_together = ["product", "color", "size"]


class customer(models.Model):
    MALE = "Male"
    FEMALE = "Female"
    OTHERS = "Others"
    genderChoices = [(MALE, MALE), (FEMALE, FEMALE), (OTHERS, OTHERS)]

    NORMAL = "Normal"
    PRO = "Pro"
    PREMIUM = "Premium"
    accountTypeChoices = [(NORMAL, NORMAL), (PRO, PRO), (PREMIUM, PREMIUM)]

    name = models.CharField(max_length=64)
    email = models.EmailField(max_length=256, unique=True)
    password = models.CharField(max_length=32)
    gender = models.CharField(
        max_length=16, choices=genderChoices, blank=True, null=True
    )
    date_of_birth = models.DateField(blank=True, null=True)
    phone_number = models.CharField(max_length=32, blank=True, null=True)
    credit_card_number = models.CharField(max_length=32, blank=True, null=True)
    account_type = models.CharField(
        max_length=16, choices=accountTypeChoices, default=NORMAL
    )
    token = models.CharField(max_length=256, unique=True, blank=True, null=True)

    def __str__(self):
        return self.name


class cart(models.Model):
    customer = models.OneToOneField(customer, on_delete=models.CASCADE)
    products = models.ManyToManyField(inventory, through="cart_item")
    total_costs = models.FloatField(default=0.0)  # sum of all subtotals
    freight = models.FloatField(default=5.0)

    def __str__(self):
        return "{}'s cart".format(self.customer.name)


class cart_item(models.Model):
    inventory = models.ForeignKey(inventory, on_delete=DO_NOTHING)
    cart = models.ForeignKey(cart, on_delete=models.CASCADE, related_name="items")
    quantity = models.PositiveBigIntegerField()
    subtotal_costs = models.FloatField()

    def __str__(self):
        return "item in {}: {} (q={}, subtotal={})".format(
            self.cart, self.inventory, self.quantity, self.subtotal_costs
        )

    class Meta:
        unique_together = ["inventory", "cart"]


class order(models.Model):
    COD = "Cash On Delivery"
    ISP = "In-store Pickup"
    HD = "Home Delivery"
    typeChoices = [(COD, COD), (ISP, ISP), (HD, HD)]

    customer = models.ForeignKey(customer, on_delete=DO_NOTHING)
    inventories = models.ManyToManyField(inventory, through="order_item")
    address = models.CharField(max_length=128)
    type = models.CharField(max_length=32, choices=typeChoices)
    final_costs = models.FloatField()  # total costs - coupon + freight
    ordered_date = models.DateTimeField(blank=True, null=True)  # blank if not ordered
    paid_date = models.DateTimeField(default=timezone.now)
    shipped_date = models.DateTimeField(blank=True, null=True)  # blank if not shipped
    arrived_date = models.DateTimeField(blank=True, null=True)  # blank if not arrived
    picked_up_date = models.DateTimeField(blank=True, null=True)  # blank if not picked


class order_item(models.Model):
    inventory = models.ForeignKey(inventory, on_delete=DO_NOTHING)
    order = models.ForeignKey(order, on_delete=models.CASCADE)
    quantity = models.PositiveBigIntegerField()
    subtotal_costs = models.FloatField()


class favorite_item(models.Model):
    customer = models.ForeignKey(customer, on_delete=DO_NOTHING)
    product = models.ForeignKey(product, on_delete=DO_NOTHING)

    def __str__(self):
        return "{} / {}".format(self.customer.name, self.product.name)

    class Meta:
        unique_together = ["customer", "product"]
