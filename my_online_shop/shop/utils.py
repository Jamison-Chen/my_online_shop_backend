from django.contrib.auth.tokens import PasswordResetTokenGenerator
import threading


class EmailThreading(threading.Thread):
    def __init__(self, email):
        self.email = email
        threading.Thread.__init__(self)

    def run(self):
        self.email.send()


class EmailVerifyTokenGenerator(PasswordResetTokenGenerator):
    def _make_hash_value(self, user, timestamp):
        return str(user.id) + str(timestamp) + str(user.is_email_verified)


emailVerifyTokenGenerator = EmailVerifyTokenGenerator()

EMAIL_SEND_MESSAGE = "We've just send you an email to verify this account. Please check your email inbox, and then go back here to log in."
