<?php
  function fetchUrl($url) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'); //Good idea to update it to latest browser
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

	    if ($httpCode == 404) {
	        return null;
	    }

    return $response;
  }
//php gensmap.php
  include "sitemap-generator.php";
  echo "generate sityemap.xml v2026.08.29";
//Check if the script is running in CLI mode
  if (php_sapi_name() !== 'cli') {
    die("This script can only be run from the command line.\n");
  }
 
  echo "Total arguments count (\$argc): " . $argc . "\n";
  echo "Script name (\$argv[0]): " . $argv[0] . "\n";

//Loop through the actual user arguments
  if ($argc > 1) {
    echo "Passed arguments:\n";
    for ($i = 1; $i < $argc; $i++) {
        echo " - Argument $i: " . $argv[$i] . "\n";
    }
  }
//Create an object of the generator class passing the config file
  $smg = new SitemapGenerator(include("sitemap-config.php"));
//Run the generator
  $smg->GenerateSitemap();
/*
//$html = '<html>  <body><div><a href="https://example.com">Example</a></div><p><a href="/about">About</a></p></body></html>';
  $html = fetchUrl("http://localhost/arith.online/index.html");
  echo $html;
  $doc = new DOMDocument();
//Suppress warnings for malformed HTML
  @$doc->loadHTML($html);
  $xpath = new DOMXPath($doc);
//Evaluate the XPath expression
  $nodes = $xpath->evaluate('/html/body//a');
  foreach ($nodes as $node) {
    echo "HREF: " . $node->getAttribute('href') . " - Text: " . $node->nodeValue . "\n";
  }
*/
?>
