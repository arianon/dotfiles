#!/usr/bin/env ruby
# coding: utf-8

HORA = (ARGV.first || 16).to_i
DIA = 6 * HORA
SEMANA = 5 * DIA
MES = 4 * SEMANA
AÑO = 12 * MES

VEF = 1150
BTC = 450.0

def conv(n)
  [n, n.to_f / BTC, n * VEF]
end

hora = conv(HORA)

message = <<EOF
Dado que el dolar valga %d BsF y el bitcoin %d BTC;
Ganancias previstas con $%d | ฿%.2f | %d BsF la hora

Diario (6 horas): $%d | ฿%.2f | %d BsF
Semanal (5 dias): $%d | ฿%.2f | %d BsF
Mensual (4 sems): $%d | ฿%.2f | %d BsF
Anual (12 meses): $%d | ฿%.2f | %d BsF
EOF


printf(message, VEF, BTC, *conv(HORA), *conv(DIA), *conv(SEMANA), *conv(MES), *conv(AÑO))

