d = {'a': 1, 'b': {'c': 2}, 'd': ["hi", {'foo': "bar"}]}

def get_dtype(obj):
    if type(obj) == list or type(obj) == tuple:
        return True
    else:
        return False
        
def get_dtype_1(obj):
    return type(obj)

def fun_1(data, key):
    if type(data) != dict:
        print("Please pass the dictionary to proceed further")
    else:
        for k, v in data.items():
            if get_dtype(v) and k==key:
                if get_dtype_1(v) == dict:
                    print(v)
                else:
                    print(v)
            elif k==key:
                print(v)
 
    
fun_1(d,'b')