function FindProxyForURL(url, host) {
   if (shExpMatch(host,"*.example.com")) {
    return "PROXY 127.0.0.1:3128";
   }
}