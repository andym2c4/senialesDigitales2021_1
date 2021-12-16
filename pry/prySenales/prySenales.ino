//pines:
#define SENIALES A0
typedef union{
  float number;
  uint8_t bytes[4];
}tipoValor;
void setup() {
  pinMode(SENIALES,INPUT);
  Serial.begin(19200);
}
tipoValor senial;
//int i=0;
void loop() {
  
  //lectura de la temperatura (señal)
  senial.number=analogRead(SENIALES);
  //obtener señal:
  //Serial.print(i);
  //Serial.print(",");
  for(int i=0;i<4;i++){
    Serial.write(senial.bytes[i]);  
  }
  
  Serial.write("\n");
  //i=i+1;
}
