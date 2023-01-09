d = {'a': 1, 'b': {'c': 2}, 'd': ["cricket", {'king': "kohli"}]}
def get_dtype(obj):
    if type(obj) == list or type(obj) == tuple:
        return True
    else:
        return False

def getval(d):
    out = {}
    for key, val in d.items():
        if type(val) == dict:
            val = [val]
        if type(val) == list:
            for subdict in val:
                if type(subdict) ==str:
                    out[key] = subdict
                else:
                    deeper = getval(subdict).items()
                    out.update({key2: val2 for key2, val2 in deeper})
        else:
            out[key] = val
            
    last_out=out        
    #print("print",last_out)
    return out

def fun_1(data, key):
    if type(data) != dict:
        print("Please pass the dictionary to proceed further")
    else:
        flag='0'
        for k, v in data.items():
            if get_dtype(v) and k==key:
                if type(v) == dict:
                    print(v)
                    flag='1'
                else:
                    print(v)
                    flag='1'
            elif k==key:
                print(v)
                flag='1'

        if flag=='1':
            flag='1'
        else:
            flag='1'
            dict_1=getval(data)
            print(dict_1[key])

                
    
fun_1(d,'king')