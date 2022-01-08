module KafkaHelper
    class << self
        def create_log(domain,action,actor,domain_id)
            log= {
                service: "Blog",
                domain: domain,
                action: action,
                domain_id: domain_id,
                actor: actor
            }
        end
        
        
    end
    
end