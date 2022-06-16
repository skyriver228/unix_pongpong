f = open("./requirements.txt", 'r')
new_req = """"""
while True:
    line = f.readline()
    if not line: break
    s_l = line.split("=")
    req = s_l[0] + "==" + s_l[1] + "\n"
    print(req)
    new_req += req
f.close()

f = open("./new_requirments.txt", 'w')
f.write(new_req)
f.close()