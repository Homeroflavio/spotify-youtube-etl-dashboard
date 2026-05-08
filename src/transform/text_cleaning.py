def limpar_texto(texto):
    if not texto:
        return ""

    texto = texto.lower()

    palavras_ruins = [
        "official", "video", "live", "lyrics",
        "lyric", "clip", "hd", "4k"
    ]

    for palavra in palavras_ruins:
        texto = texto.replace(palavra, "")

    # remove espaços duplicados para melhor comparações de score
    
    texto = " ".join(texto.split())

    return texto