declareTaskLoop(T1);
declareTaskLoop(T2);
declareTaskLoop(T3);

int c = 0;

taskLoop (T1)
{
  digitalWrite(11, HIGH);
  delay(400);
  digitalWrite(11, LOW);
  delay(400);
}

taskLoop (T2)
{
  digitalWrite(12, HIGH);
  delay(1000);
  digitalWrite(12, LOW);
  delay(1000);
}

taskLoop (T3)
{
  delay(77);
  Serial.print(c++);
}

void setup()   
{                
  Serial.begin(9600);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);

  createTaskLoop(T1, NORMAL_PRIORITY);
  createTaskLoop(T2, NORMAL_PRIORITY);
  createTaskLoop(T3, NORMAL_PRIORITY);
}

void loop()                     
{
  delay(999999);
}

