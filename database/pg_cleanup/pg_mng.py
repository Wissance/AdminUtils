#!/usr/bin/python
# This is a Python script for easily db cleanup from server
import types
class PgSqlManager():
    def __init__(self, *args, **kwargs):
        """
            This function prepares PgSqlManager to perform some operations over Postgres SQL Databases
        :param args:
        :param kwargs:
        """
        #todo(UMV): init config
        self._hostName = 'localhost'
        self._port = 5432
        self._userName = 'postgres'
        self._password = '123'
        pass
    def get_db_list(self) -> list:
        return []

    def drop_db(self, databases):
        pass

    _hostName = ''
    _port = -1
    _userName = ''
    _password = ''
def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
