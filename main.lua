local colorReset = "\27[0m"
local colorRed = "\27[31m"
local colorGreen = "\27[32m"
local colorYellow = "\27[33m"

local Messwerte = {
    {U=280.5,
    r=0.058,
    I=0.02,
    R=0.1575,
    N=130},
    {U=320,
    r=0.0405,
    I=0.08,
    R=0.1575,
    N=130},
    {U=110,
    r=0.059,
    I=0.03,
    R=0.1575,
    N=130},
    {U=247,
    r=0.056,
    I=0.02,
    R=0.1575,
    N=130},
    {U=200,
    r=0.041,
    I=0.05,
    R=0.1575,
    N=130}
}

-- Function to print colored text
function printColoredText(color, text)
    print(color .. text .. colorReset)
end

-- Constants
local e = (1.602177*10^(-19))

local mu0 = (1.2566*10^(-6))

-- Loop through table "Messwerte"
for i, v in pairs(Messwerte) do

    local B = mu0 * ((8 * v["N"]) / (math.sqrt(125 * v["R"]))) * v["I"]                                         -- B-Feld Berechnung

    printColoredText(colorRed, "B fuer Messung "..i..": "..B)

    local EdivM = ((2 * v["U"]) / (B^(2) * v["r"]^(2)))                                                         -- e/m Berechnung

    printColoredText(colorYellow, "e/m fuer Messung "..i..": "..EdivM)

    local me = ((e * ((mu0 * (8 * v["N"]) / (math.sqrt(125 * v["R"])) * v["I"]) * v["r"])^2) / (2 * v["U"]))    -- me Berechnung

    printColoredText(colorGreen, "Elektronenmasse berechnet fuer Messung "..(i)..": "..me)

end