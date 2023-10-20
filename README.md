# Purpose:

Spring Gateway is a simple way to provide a route to APIs and provide features like security, monitoring/metrics, and resiliency.
They use a reactive, non-blocking architecture that can scale to handle a large number of concurrent requests. 
It's a powerful way to route and manage network traffic into to your applications

## Features:

### Spring Cloud Gateway features:

 - Built on Spring Framework and Spring Boot
 - Able to match routes on any request attribute.
 - Predicates and filters are specific to routes.
 - Circuit Breaker integration.
 - Spring Cloud DiscoveryClient integration
 - Easy to write Predicates and Filters
 - Request Rate Limiting
 - Path Rewriting

## Build docker and deploy on kubernetes

* ./deploy.sh

#### or

*   docker build -t gateway/gateway .
*   docker run -p 8080:8080 -t gateway/gateway

## Docs and references:

* https://spring.io/projects/spring-cloud-gateway
* https://cloud.spring.io/spring-cloud-gateway/reference/html/
* https://www.solo.io/topics/api-gateway/api-gateway-spring-boot/