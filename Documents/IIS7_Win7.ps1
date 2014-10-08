        $ErrorActionPreference  = "Stop";
        
        write-host "Starting setup…" -foregroundcolor yellow;
        
        #First check if .NET 4.0 is installed
     
        $net40Path = [System.IO.Path]::Combine($env:SystemRoot, "Microsoft.NET\Framework\v4.0.30319");
        $aspnetRegIISFullName = [System.IO.Path]::Combine($net40Path, "aspnet_regiis.exe");
     
        if ((test-path $aspnetRegIISFullName) -eq $false)
        {
            $message =  "aspnet_regiis.exe was not found in {0}. Make sure that Microsoft .NET Framework 4.0 is installed first." -f $net40Path;
            write-error $message;
        }
     
        write-host "Microsoft .NET Framework 4.0 appears to be installed." -foregroundcolor green;
     
        import-module PSClientManager
                    	 
        #Install features
        write-host "Installing features…" -foregroundcolor yellow;
         Add-ClientFeature –Name IIS-IIS6ManagementCompatibility  –Force
		 Add-ClientFeature –Name IIS-Metabase –Force
		 Add-ClientFeature –Name IIS-ManagementScriptingTools -Force 
		 Add-ClientFeature –Name IIS-ManagementService -Force
		 Add-ClientFeature –Name IIS-DefaultDocument -Force
		 Add-ClientFeature –Name IIS-DirectoryBrowsing -Force
		 Add-ClientFeature –Name IIS-HttpErrors -Force
		 Add-ClientFeature –Name IIS-HttpRedirect -Force
		 Add-ClientFeature –Name IIS-StaticContent -Force
		 Add-ClientFeature –Name IIS-NetFxExtensibility -Force
		 Add-ClientFeature –Name IIS-ASPNET -Force
		 Add-ClientFeature –Name IIS-ASP -Force
		 Add-ClientFeature –Name IIS-CGI -Force
		 Add-ClientFeature –Name IIS-ISAPIExtensions -Force
		 Add-ClientFeature –Name IIS-ISAPIFilter -Force
		 Add-ClientFeature –Name IIS-WebDAV -Force
		 Add-ClientFeature –Name IIS-CustomLogging -Force
		 Add-ClientFeature –Name IIS-HttpLogging -Force
		 Add-ClientFeature –Name IIS-LoggingLibraries -Force
		 Add-ClientFeature –Name IIS-ODBCLogging -Force
		 Add-ClientFeature –Name IIS-RequestMonitor -Force
		 Add-ClientFeature –Name IIS-HttpTracing -Force
		 Add-ClientFeature –Name IIS-HttpCompressionStatic -Force
		 Add-ClientFeature –Name IIS-HttpCompressionDynamic -Force
		 Add-ClientFeature –Name IIS-BasicAuthentication -Force
		 Add-ClientFeature –Name IIS-WindowsAuthentication -Force
		 Add-ClientFeature –Name IIS-DigestAuthentication -Force
		 Add-ClientFeature –Name IIS-ClientCertificateMappingAuthentication -Force
		 Add-ClientFeature –Name IIS-IISCertificateMappingAuthentication -Force
		 Add-ClientFeature –Name IIS-RequestFiltering -Force
		 Add-ClientFeature –Name IIS-IPSecurity -Force
		 Add-ClientFeature –Name IIS-URLAuthorization -Force
		 Add-ClientFeature –Name WAS-WindowsActivationService -Force 
		 Add-ClientFeature –Name WAS-ProcessModel -Force
		 Add-ClientFeature –Name WAS-NetFxEnvironment -Force 
		 Add-ClientFeature –Name WAS-ConfigurationAPI -Force
		 Add-ClientFeature –Name WCF-HTTP-Activation -Force
		 Add-ClientFeature –Name IIS-ManagementConsole -Force
		 Add-ClientFeature –Name IIS-HostableWebCore -Force
		 Add-ClientFeature –Name IIS-WebServerRole -Force
		 Add-ClientFeature –Name IIS-WebServer -Force
		 Add-ClientFeature –Name IIS-CommonHttpFeatures -Force
		 Add-ClientFeature –Name IIS-ApplicationDevelopment -Force
		 Add-ClientFeature –Name IIS-Security -Force
		 Add-ClientFeature –Name IIS-HealthAndDiagnostics -Force
		 Add-ClientFeature –Name IIS-Performance -Force
		 Add-ClientFeature –Name IIS-WebServerManagementTools -Force
		 Add-ClientFeature –Name IIS-ServerSideIncludes -Force
		 Add-ClientFeature –Name IIS-WMICompatibility -Force
		write-host "Features installed." -foregroundcolor green;
     
        #Register ASP.NET 4.0 with IIS
     
        write-host "Registering ASP.NET 4.0 with IIS…" -foregroundcolor yellow;
        start-process -filepath $aspnetRegIISFullName  -argumentlist "-iru";
            
        write-host "Setup complete." -foregroundcolor green;

     
    