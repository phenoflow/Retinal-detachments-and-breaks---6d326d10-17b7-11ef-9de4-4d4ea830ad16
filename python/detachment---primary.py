# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"1481.00","system":"readv2"},{"code":"24347.0","system":"readv2"},{"code":"2496.0","system":"readv2"},{"code":"4232.0","system":"readv2"},{"code":"61965.0","system":"readv2"},{"code":"34183.0","system":"readv2"},{"code":"53021.0","system":"readv2"},{"code":"1552.0","system":"readv2"},{"code":"8506.0","system":"readv2"},{"code":"50694.0","system":"readv2"},{"code":"1202.0","system":"readv2"},{"code":"62773.0","system":"readv2"},{"code":"55469.0","system":"readv2"},{"code":"29800.0","system":"readv2"},{"code":"35250.0","system":"readv2"},{"code":"71651.0","system":"readv2"},{"code":"21067.0","system":"readv2"},{"code":"62901.0","system":"readv2"},{"code":"2484.0","system":"readv2"},{"code":"38407.0","system":"readv2"},{"code":"45509.0","system":"readv2"},{"code":"24440.0","system":"readv2"},{"code":"6836.0","system":"readv2"},{"code":"32028.0","system":"readv2"},{"code":"47730.0","system":"readv2"},{"code":"72901.0","system":"readv2"},{"code":"34373.0","system":"readv2"},{"code":"38463.0","system":"readv2"},{"code":"30514.0","system":"readv2"},{"code":"53020.0","system":"readv2"},{"code":"1551.0","system":"readv2"},{"code":"H33.0","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('retinal-detachments-and-breaks-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["detachment---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["detachment---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["detachment---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
