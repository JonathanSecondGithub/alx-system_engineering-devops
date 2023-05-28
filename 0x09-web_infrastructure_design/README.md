`QUESTION 0`
`EXPLANATION`
1. The user types the domain name www.foobar.com into the web browser
2. The browser then sends a request to the router
3. The router passes the message to the DNS server.
The DNS server implements the A record type and maps the domain name www.foobar.com to the IP address 8.8.8.8
4. The DNS server then sends a response message to the router.
5. The router then passes the message to the browser with the requested IP address.
6. The browser then sends a request for the website to the server.
7. In the server the web server sends a HTTP request to the application server.
8. The application server interprets the request and forms a query depending on the requested data by the user and sends this to the database.
9. The database then sends a response of the requested information
10. The application server then formulates a HTML version of the request that can be viewed by the browser.
11. This is sent as a HTTP response to the web server which then serves the web page back to the server.

`ISSUES WITH THE CURRENT INFRASTRUCTURE`
1. The current system has multiple single points of failure (SPOF)for example having only one server means that when the server fails the whole system fails.
2. Lack of a load balancer in the current infrastructure also means that control of traffic to the server is very inefficient.
3. Also during repair due to lack of redundancy, the whole system has to be shut down until the repair is complete.



`QUESTION 1`
`EXPLANATIONS`
The current web architecture implementation shows 3 servers ie two are active while on one is passive. In this case the 2 active servers can be used for fault tolerance and distribution of load to ensure operations take place twice as fast.

In this case we will use the round robin load balacing algorithm. This algorithm passes each new connection request to the next server in line, eventually distributing connections evenly across the array of machines being load balanced.

In this case we have implemented an active-active server architecture in which we have 2 servers running simultaneously. This is in order to make web application operation like database access more efficient by splitting the load across multiple servers.

On the other hand, an active-passive server architecture is a type of high availability (HA) solution that uses two servers, one of which is active and the other passive. The active server handles all requests from clients, while the passive server is idle and only takes over if the active server fails. This acts as a fault tolerance mechanism.

A primary-replica (master-slave) cluster is a type of database cluster that uses a master-slave replication topology. In this topology, there is one master database server and one or more slave database servers. The master database server is responsible for all writes to the database, while the slave database servers are responsible for reading from the database.
When a write operation is performed on the master database server, the change is replicated to all of the slave database servers. This ensures that all of the slave database servers have a consistent copy of the data.

`ISSUES WITH THE CURRENT INFRASTRUCTURE`
1. The lack of SSL certificates means that users data that is sent to the web server is not encrypted and can therefore be accessed in transit by unauthorized people.
2. Lack of a firewall also means that information moving to and from the internet  is not filtered to check for malicious programs and unauthorized access and therefore the user is vulnerable to attacks.
3. Also lack of monitoring tools means that performance issues may arise due to an unoptimised architecture.
4. Also not monitoring may lead to compliance issues in the architecture.
5. A single point of failure in the architecture is that there is only one load balancer meaning that when the load balancer fails the whole system may fail.



`QUESTION 2`
`EXPLANATIONS`
Firewalls: Firewalls are basically used to filter incoming and outgoing traffic. One firewall on the load balancer filters traffic to and from the web server and the users repectively. Each active server also has a firewall to filter traffic and ensure no malicious programs make it ot the server or unauthorized access.
SSL certificate: An SSL certificate, also known as a Secure Sockets Layer certificate, is a digital certificate that authenticates the identity of a website and encrypts the traffic between the website and the user's browser. SSL certificates are used to protect sensitive information such as credit card numbers and passwords.
Monitoring Tools Added:
1. DataDog : DataDog allows you to measure and monitor everything with graphs. It gathers performance data from all your application components. The service has a lot of integrations. 
2. WaveFront : It is able to analyze anything that can produce data points. A query language that looks like SQL allows users to apply mathematical operations to these data points to extract values or detect anomalies from the time series data.
3. Uptime Robot : this is a simple service that will check that your website is responding from multiple locations in the world. 

Qeuries per second is a metric used to measure the traffic of a website and can therefore to make various business decisions such as scaling up or down of purchasing new hardware.

`ISSUES WITH THE CURRENT INFRASTRUCTURE`
1. Terminating SSL at the load balancer level can be an issue because it can increase the load on the load balancer and reduce the performance of the application servers.

When SSL is terminated at the load balancer level, the load balancer must decrypt all of the traffic before passing it to the application servers. This can be a significant amount of work, and it can slow down the performance of the load balancer.

2. Having only one MySQL server capable of accepting writes is an issue because it can lead to a single point of failure. If the MySQL server goes down, no new data can be written to the database. This can cause a number of problems, including:
Data loss
Performance degradation
Increased security risks

3. Having servers with all the same components (database, web server and application server) might be a problem because it might lead to scalability issues because all components of the server have to be scaled instead of the only the components that need upscaling eg to upscale the database also the web server and application server has to nr upscaled.

It is also difficult to maintain because a database error may be in any server as compared to a dedicated server where troubleshooting can be done easily.

`QUESTION 3`
EXPLANATIONS
Each of the components now has a dedicated server and this enables efficient scalability of the web architecture and easy monitoring of the resources.

Load balancers configured as a cluster work by distributing traffic across multiple load balancers. This helps to improve performance and reliability by preventing any single load balancer from becoming overloaded.
