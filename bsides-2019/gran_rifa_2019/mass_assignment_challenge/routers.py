import threading

globals = threading.local()


class RouterMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.user and not request.user.is_anonymous:
            globals.db = request.user.username
        else:
            globals.db = "default"
        return self.get_response(request)


class RouterDB(object):

    def db_for_read(self, model, **hints):
        db = "default"
        if hasattr(globals, 'db') and not hasattr(model, "session_key") and not hasattr(model, "username"):
            db = globals.db
        return db

    def db_for_write(self, model, **hints):
        db = "default"
        if hasattr(globals, 'db') and not hasattr(model, "session_key") and not hasattr(model, "username"):
            db = globals.db
        return db
