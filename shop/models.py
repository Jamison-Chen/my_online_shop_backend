from django.db import models
from django.db.models.deletion import DO_NOTHING, SET_NULL
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
    category = models.ForeignKey(category, on_delete=SET_NULL, null=True)
    brand = models.ForeignKey(brand, on_delete=models.CASCADE)
    name = models.CharField(max_length=32)
    unit_price = models.FloatField()
    description = models.TextField(blank=True, null=True)
    inventory = models.PositiveIntegerField()
    
    def __str__(self):
        return self.name
    
class product_picture(models.Model):
    def path(instance, filename):
        return 'product/{}_{}/{}'.format(instance.product.name,
                                         instance.product.id, filename)
    product = models.ForeignKey(product, on_delete=models.CASCADE)
    picture = models.ImageField(max_length=1024, upload_to=path)
    
class customer(models.Model):
    MALE = 'Male'
    FEMALE = 'Female'
    OTHERS = "Others"
    genderChoices = [(MALE, MALE), (FEMALE, FEMALE), (OTHERS, OTHERS)]
    
    NORMAL = 'Normal'
    PRO = 'Pro'
    PREMIUM = 'Premium'
    accountTypeChoices = [(NORMAL, NORMAL), (PRO, PRO), (PREMIUM, PREMIUM)]
    
    first_name = models.CharField(max_length=32)
    last_name = models.CharField(max_length=32)
    gender = models.CharField(max_length=16, choices=genderChoices)
    date_of_birth = models.DateField(blank=True, null=True)
    email = models.EmailField(max_length=256, blank=True, null=True)
    phone_number = models.CharField(max_length=32, blank=True, null=True)
    address = models.CharField(max_length=64, blank=True, null=True)
    credit_card_number = models.CharField(max_length=32, blank=True, null=True)
    account_name = models.CharField(max_length=16, unique=True)
    account_type = models.CharField(max_length=16, choices=accountTypeChoices,
                                    default=NORMAL)
    password = models.CharField(max_length=32)
    
    @property
    def full_name(self):
        return "{} {}".format(self.first_name, self.last_name)
    
    def __str__(self):
        return self.full_name

class cart(models.Model):
    customer = models.ForeignKey(customer, on_delete=models.CASCADE)
    products = models.ManyToManyField(product, through='cart_item')
    total_costs = models.FloatField()
    is_ordered = models.BooleanField(default=False)
    order_date = models.DateTimeField(blank=True, null=True)

class cart_item(models.Model):
    product = models.ForeignKey(product, on_delete=DO_NOTHING)
    cart = models.ForeignKey(cart, on_delete=models.CASCADE)
    quantity = models.PositiveBigIntegerField()
    subtotal_costs = models.FloatField()

class payment(models.Model):
    CASH = 'Cash'
    CREDIT_CARD = 'Credit Card'
    typeChoices = [(CASH, CASH), (CREDIT_CARD, CREDIT_CARD)]
    
    customer = models.ForeignKey(customer, on_delete=models.CASCADE)
    cart = models.ForeignKey(cart, on_delete=models.CASCADE)
    type = models.CharField(max_length=16, choices=typeChoices)
    amount = models.FloatField()
    done_date = models.DateTimeField(default=timezone.now)
    
    class Meta:
        unique_together = (("customer", "cart"),)