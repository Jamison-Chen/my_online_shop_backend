from django.test import TestCase

# Create your tests here.
def test(*args):
    print(bool("") == True)


test("hello", "world")
