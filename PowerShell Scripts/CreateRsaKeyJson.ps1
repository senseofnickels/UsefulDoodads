function Create-RsaKeyJson {

    param(
        [int]$KeyLength
    )

    $rsakey = [System.Security.Cryptography.RSA]::Create($KeyLength)

    $keyParams = $rsakey.ExportParameters($true)
    $jwkObj = @{
        "D" = [Convert]::ToBase64String($keyParams.D);
        "DP" = [Convert]::ToBase64String($keyParams.DP);
        "DQ" = [Convert]::ToBase64String($keyParams.DQ);
        "Exponent" = [Convert]::ToBase64String($keyParams.Exponent);
        "InverseQ" = [Convert]::ToBase64String($keyParams.InverseQ);
        "Modulus" = [Convert]::ToBase64String($keyParams.Modulus);
        "P" = [Convert]::ToBase64String($keyParams.P);
        "Q" = [Convert]::ToBase64String($keyParams.Q);
    }

    $jwkObj | ConvertTo-Json
}