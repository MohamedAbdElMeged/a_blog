class BlogWorker
    include Sidekiq::Worker
    def perform(object_log , object_id)
        kafka = Kafka.new
        kafka.produce_message(
            APP_CONFIG['kafka_topic'],object_log,object_id
        )
        puts "done pushing to kafka"
    end
end