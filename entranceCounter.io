#define TRIG 2 // 모듈에 부여 된 이름을 떠올리자. 초음파 센서를 사용했다. 
#define ECHO 3 // 아날로그 속성인지 디지털 속성인지 구분해서 핀을 부여하자. 아날로그 출력을 해야하면 3,5,6,9,10,11번을 꼽는다

void setup(){
  pinMode(TRIG,OUTPUT);
  pinMode(ECHO,INPUT);
  
}

void loop(){
  digitalWrite(TRIG,LOW); //TRIG는 TTL파형을 만들어 낸다.
  delayMicroseconds(5); // 초음파 센서가 값을 처리 할 충분한 시간을 주어야 한다.
  digitalWrite(TRIG,HIGH);
  delayMicroseconds(5);
  digitalWrite(TRIG,LOW);

  long distance = pulseIn(ECHO,HIGH)/58.2; //p는 소문자, I는 대문자, l은 소문자

  if(distance<30){// 거리가 30cm 이하 일때에만 초음파 센서가 작동하게끔 제한을 걸었다.
  tone(8, 300, 20); // 스피커가 소리를 내기 위한 목적 1이다.
  delay(100); // 사람이 편하게 소리를 들을 수 있게 하기 위해서 목적2로 delay(100)을 추가했다. 이게 없으면 소리가 너무 지지지직 거려서 신경질 난다.
  tone(8, 300, 20); // 위급 상황임을 만들어주기 위해서 목적 3으로 tone을 하나 더 추가했다.  
  delay(distance); // 목적 4로 새로운 주기를 형성하는 방법이며 목적5로 물체가 엄청 멀리 있으면 tone으로 다시 돌아가지 않게끔 막게 한다.
  } // 여러 개의 조건이 필요 없기 때문에 else나 else if를 사용하지 않았다.
   // duration에 distance를 할당하면 멀리 있을 때도 경보음을 울려서 별로다.
  noTone(8);
  // 소리 멈추는 톤 noTone(pin); t는 대문자, 소괄호 내부에는 핀 번호만 들어갈 수 있다.
}
