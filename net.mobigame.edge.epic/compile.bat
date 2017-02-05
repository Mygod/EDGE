@java -jar -Duser.language=en SYSTEM.EAD/apktool_2.2.2.jar b -f src
@java -jar SYSTEM.EAD/signapk.jar SYSTEM.EAD/testkey.x509.pem SYSTEM.EAD/testkey.pk8 src/dist/edge.epic.apk net.mobigame.edge.epic.apk
