import unittest

class TestCalc(unittest.TestCase):

    def test_upper(self):
        self.assertEqual('foo'.upper(),'blub')



if __name__ == '__main__':
    unittest.main()
