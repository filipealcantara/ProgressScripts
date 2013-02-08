FOR EACH titupres USE-INDEX titupre4
    WHERE titupres.referencia           = 'dezembro12'
    AND   titupres.cd-unidade           = 51
    AND   titupres.cd-unidade-prestador = 51
    AND   titupres.cd-tipo-medicina     = 01
    AND   titupres.cd-prestador         = 404
    AND   titupres.cod-esp              = 'pd'
    AND   titupres.nr-docto             = 189
    AND   titupres.parcela              = 1 NO-LOCK,
    EACH movipres USE-INDEX movipre5
	WHERE movipres.referencia             = titupres.referencia
	AND   movipres.cd-unidade             = titupres.cd-unidade
	AND   movipres.cd-unidade-prestador   = titupres.cd-unidade-prestador
	AND   movipres.cd-prestador           = titupres.cd-prestador
	AND   movipres.cd-tipo-medicina       = titupres.cd-tipo-medicina
	AND   movipres.cod-esp                = titupres.cod-esp
	AND   movipres.nr-nota-parcela        = STRING(titupres.nr-docto, "99999999") + STRING(titupres.parcela, "99")
	AND   movipres.cd-evento              = 112 NO-LOCK:

    DISP titupres.cd-userid movipres.cd-mod-plano-tipo-modulo movipres.vl-movto.
        
    
END.
