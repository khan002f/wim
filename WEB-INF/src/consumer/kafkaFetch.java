package consumer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;

public class kafkaFetch {
	
	int[] offset_pointer;
	/*public int[] getPointer()
	{
		
	}
	public void setPointer()
	{
		
	}*/
	public ArrayList<String> getMsg() throws IOException, InterruptedException
	{
		String brokers = "omnibus-01.srvs.cloudkafka.com:9094"; //System.getenv("omnibus-01.srvs.cloudkafka.com:9094");
		String username = "zc36obgk";//System.getenv("zc36obgk");
		String password = "iAVTdQIjwiHkl4f_oBaByzlMMUzPYB8K"; //System.getenv("iAVTdQIjwiHkl4f_oBaByzlMMUzPYB8K");
		String jaasTemplate = "org.apache.kafka.common.security.scram.ScramLoginModule required username=\"%s\" password=\"%s\";";
        String jaasCfg = String.format(jaasTemplate, username, password);

        String serializer = StringSerializer.class.getName();
        String deserializer = StringDeserializer.class.getName();
        
        ArrayList<String> data = new ArrayList<String>();
        
        int offset_min[]= {56716,56906,56748,56378,56549};//new Integer[5];
        int[] offset_pointer= new int[5];//= {56681,56859,56711,56317,56512};//new Integer[5];
        offset_pointer[0]=1;
        System.out.println(offset_pointer[0]);
        
				
		//List<String> lst=Arrays.asList(new String[] {""});
		Properties props =new Properties();
		props.put("bootstrap.servers", brokers);
        props.put("group.id", username + "-consumer");
        props.put("enable.auto.commit", "true");
        props.put("auto.commit.interval.ms", "1000");
        props.put("auto.offset.reset", "earliest");
        props.put("session.timeout.ms", "30000");
        props.put("key.deserializer", deserializer);
        props.put("value.deserializer", deserializer);
        props.put("key.serializer", serializer);
        props.put("value.serializer", serializer);
        props.put("security.protocol", "SASL_SSL");
        props.put("sasl.mechanism", "SCRAM-SHA-256");
        props.put("sasl.jaas.config", jaasCfg);
        
		
        KafkaConsumer<String,String> consumer=new KafkaConsumer<>(props);
        String topic = username + "-default";
        try
        {
        	for(int j=0;j<5;j++)
            {
            	TopicPartition topicPartition = new TopicPartition(topic,j);
                List<TopicPartition> topics=Arrays.asList(topicPartition);
                consumer.assign(topics);
                //consumer.seekToBeginning(topics);
               consumer.seekToEnd(topics);
                long current=consumer.position(topicPartition);
                
                consumer.seek(topicPartition, offset_min[j]);
                //for(int i=1;i<=2;i++)
            	//{
                	ConsumerRecords<String, String> records=consumer.poll(100);
                	for(ConsumerRecord<String, String> record: records)
                	{
                		//System.out.printf("partition=%d, offset = %d, key = %s, value = %s%n",record.partition(), record.offset(), record.key(), record.value());
                		//System.out.println(record.value());
                		data.add(record.value());
                	}
                	//System.out.println("2nd");
            	//}
                	//System.out.println(current);
            }
        }
        catch(Exception e)
        {
        	e.getStackTrace();
        }
        finally
        {
        	consumer.close();
        }
        
        
        
        //System.out.println(data);
        return data;
	}
	/*
	public static void main(String[] args) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		
		ArrayList<String> Message=new kafkaFetch().getMsg();
		for(String msg:Message)
		{
			//System.out.println(msg);
			String temp[]=msg.split("\\|");
			//System.out.println(temp.length);
			//System.out.println(msg);
			for(String m:temp)
			{
				System.out.print(" ( "+ m+" ) ");
			}	
			System.out.println("\n");
		}

	}*/

}
