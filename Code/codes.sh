nc 192.168.1.10 9100 < Report.pcl

# Windows

$printerIP = "192.168.1.10"  # This should be your print server’s actual IP address
$pclFile = "C:\Users\YourUsername\Documents\Report.pcl"  # Full path to the PCL file
$port = 9100
$address = [System.Net.IPEndPoint]::new([System.Net.IPAddress]::Parse($printerIP), $port)
$client = [System.Net.Sockets.TcpClient]::new()
$client.Connect($address)
$stream = $client.GetStream()
[byte[]]$bytes = [System.IO.File]::ReadAllBytes($pclFile)
$stream.Write($bytes, 0, $bytes.Length)
$stream.Flush()
$stream.Close()
$client.Close()
