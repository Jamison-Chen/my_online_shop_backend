from operator import mod
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
    inventory = models.PositiveIntegerField()
    quantity_sold = models.PositiveIntegerField()

    def __str__(self):
        return self.name


class product_picture(models.Model):
    def path(instance, filename):
        return "product/{}_{}/{}".format(
            instance.product.name, instance.product.id, filename
        )

    product = models.ForeignKey(product, on_delete=models.CASCADE)
    picture = models.ImageField(max_length=1024, upload_to=path)


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
    customer = models.ForeignKey(customer, on_delete=models.CASCADE)
    products = models.ManyToManyField(product, through="cart_item")
    total_costs = models.FloatField()  # sum of all subtotals
    ordered_date = models.DateTimeField(blank=True, null=True)  # blank if not ordered


class cart_item(models.Model):
    product = models.ForeignKey(product, on_delete=DO_NOTHING)
    cart = models.ForeignKey(cart, on_delete=models.CASCADE)
    quantity = models.PositiveBigIntegerField()
    subtotal_costs = models.FloatField()


class payment(models.Model):
    COD = "Cash On Delivery"
    ISP = "In-store Pickup"
    HD = "Home Delivery"
    typeChoices = [(COD, COD), (ISP, ISP), (HD, HD)]

    cart = models.OneToOneField(cart, on_delete=DO_NOTHING)
    customer = models.ForeignKey(customer, on_delete=DO_NOTHING)
    address = models.CharField(max_length=128)
    type = models.CharField(max_length=32, choices=typeChoices)
    final_costs = models.FloatField()  # total costs - coupon + delivery fee
    paid_date = models.DateTimeField(default=timezone.now)
    shipped_date = models.DateTimeField(blank=True, null=True)  # blank if not shipped
    arrived_date = models.DateTimeField(blank=True, null=True)  # blank if not arrived
    picked_up_date = models.DateTimeField(blank=True, null=True)  # blank if not picked


class favorite_item(models.Model):
    customer = models.ForeignKey(customer, on_delete=DO_NOTHING)
    product = models.ForeignKey(product, on_delete=DO_NOTHING)

    def __str__(self):
        return "{:s} / {:s}".format(self.customer.name, self.product.name)

    class Meta:
        unique_together = ["customer", "product"]
