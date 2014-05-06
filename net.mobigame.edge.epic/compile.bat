@java -jar SYSTEM.EAD/apktool.1.5.2.jar b src
@java -jar SYSTEM.EAD/signapk.jar SYSTEM.EAD/testkey.x509.pem SYSTEM.EAD/testkey.pk8 src/dist/edge.apk net.mobigame.edge.epic.apk