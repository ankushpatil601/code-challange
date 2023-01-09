d = {'a': 1, 'b': {'c': 2}, 'd': {"hi", {'foo': "bar"}}}
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
            
    return out
    
#print(getval(d['d']))
def fun_1(data,key):
    dict_1=getval(data)
    return(dict_1[key])

print(fun_1(d,'foo'))