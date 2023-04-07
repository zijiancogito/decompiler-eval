
# ERR_MSG{
        # 0: "Symbol in IR not found in C."
# }

def func_acc(ir_json_file, c_json_file):
    ir_json = None
    with open(ir_json_file, 'r') as f:
        ir_json = json.load(f)
    assert ir_json, "Load ir json failed."

    c_json = None
    with open(c_json_file, 'r') as f:
        c_json = json.load(f)
    assert c_json, "Load c json failed."

    symbols = []
    for sym in ir_json["symbols"]:
        if sym not in c_json["symbols"]:
            return 0
        symbols.append(sym)

    matched = 0
    fails = []
    for var in ir_json["expressions"]:
        if var not in c_json["expressions"][0]:
            continue
        ir_exp = sejson_to_exptree(ir_json["expressions"][var])
        c_exp = sejson_to_exptree(c_json["expressions"][0][var])
        correct_rate = sample(ir_exp, c_exp, symbols)
        if correct_rate > 0.9:
            matched += 1
        else:
            fails.append(var)

    func_accu = round(matched / len(ir_json["epxressions"]), 2)
    return func_accu

