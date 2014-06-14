
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

%hook Post

- (int)isInVisitedList
{
    if( [self visited] || [[[self rawDictionary] objectForKey:@"visited"] boolValue] ) return 1;
	else return 0;
}

- (void)markVisited
{
    NSString *url = [@"http://www.reddit.com/api/store_visits?links=" stringByAppendingString:[self name]];
    NSString *modhash = [[%c(RedditAPI) shared] modhash];
    NSString *cookie = [@"reddit_session=" stringByAppendingString:[[%c(RedditAPI) shared] cookie]];
    
//    NSLog(@"Sending request to: %@", url);
//    NSLog(@"With modhash: %@", modhash);
//    NSLog(@"With cookie: %@", cookie);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    
    [request addValue:cookie forHTTPHeaderField:@"Cookie"];
    [request addValue:modhash forHTTPHeaderField:@"X-Modhash"];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
    %orig;
}

%end
