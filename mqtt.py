import time, json, ssl json은 Javascript object notation(파이썬에 자바로 데이터를 교환하는 라이브러리를 사용)
import paho.mqtt.client as mqtt

ENDPOINT = 'a1ldwso66w4iv2-ats.iot.us-west-2.amazonaws.com'
THING_NAME = 'test-thing' ,,, THING_NAME = '(사물의 이름)'

def on_connect(mqttc, obj, flags, rc):
	if rc == 0: # 연결 성공
		print('connected!!')
		mqttc.subscribe('test/2', qos=0) # 구독

def on_message(mqttc, obj, msg):
	if msg.topic == 'test/2': ,,,메세지의 주제가 test로 이루어져 있으면 아래를 실행한다.
		payload = msg.payload.decode('utf-8') # 가져오는 메세지를 부호화(암화 해제) 시킨다. 그 메세지의 형식은 UTF-8 코덱이다.
		j = json.loads(payload)		 # payload는 관심 있는 부분으로 곧 '내가 비용을 지불코자 하는 적재량'을 뜻 한다. 
		print(j['message'])

mqtt_client = mqtt.Client(client_id=THING_NAME, clean_session=TRUE) ,,, 메세지를 보내는 클라이언트를 설정한다. 맨 처음 정한 사물의 이름이다.
mqtt_client.on_connect = on_connect ,,, 연결을 활성화 시킨다. 사물의 이름으로 접근해서 on_connect 함수를 실행 시킨다.
mqtt_client.on_message = on_message ,,, 메세지 보낸다.

mqtt_client.tls_set('./certs/ca.pem', certfile='./certs/cert.pem.crt',
	keyfile='./certs/private.pem.key', tls_version=ssl.PROTOCOL_TLSv1_2, ciphers=None)
mqtt_client.connect(ENDPOINT, port=8883)
mqtt_client.loop_start() # threaded network loop


payload = json.dumps({'action': 'test'})
mqtt_client.publish('test/1', payload, qos=1)

