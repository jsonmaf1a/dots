for zip in *.zip; do unzip "$zip" -d "${zip%*.zip}"; done
