package statelessservice;

import java.time.Duration;
import java.util.logging.Logger;
import java.util.logging.Level;

import microsoft.servicefabric.services.runtime.ServiceRegistration;

import microsoft.servicefabric.services.runtime.ServiceRuntime;

public class SfTestServiceHost {

    private static final Logger logger = Logger.getLogger(SfTestServiceHost.class.getName());

    public static void main(String[] args) throws Exception{
        try {
            ServiceRuntime.registerStatelessServiceAsync("SfTestType", (context)-> new SfTestService(), Duration.ofSeconds(10));
            logger.log(Level.INFO, "Registered stateless service of type SfTestType");
            Thread.sleep(Long.MAX_VALUE);
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Exception occurred", ex);
            throw ex;
        }
    }
}
