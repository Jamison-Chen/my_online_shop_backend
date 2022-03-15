from django.db import models


class CreateUpdateDateBase(models.Model):
    """
    Abstract base class with a creation and modification date and time
    """

    created_at = models.DateTimeField(auto_now_add=True)
    last_updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True
