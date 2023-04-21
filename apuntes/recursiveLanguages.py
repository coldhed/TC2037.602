def language(basis, rules, iter):
    if (iter == 0): return basis
    
    newLanguage = basis.copy()
    for u in basis:
        for rule in rules:
            newLanguage.add(rule.replace("u", u))

    return language(newLanguage, rules, iter - 1)




print(language({"b"}, {"ub", "uab", "uba", "bua"}, 1))
