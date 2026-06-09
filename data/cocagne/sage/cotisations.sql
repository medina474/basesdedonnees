select CT_Num as compta, 
DO_Piece as facture,
DO_Date as jour, AR_Ref as article
,[DL_Design] as libelle,[DL_Qte] as qte,DL_PUTTC as pu, DL_MontantTTC as montant
FROM F_DOCLIGNE
WHERE AR_Ref = 'ACOT' AND DO_Date > '2019-25-12'
order by ct_num, Do_date
