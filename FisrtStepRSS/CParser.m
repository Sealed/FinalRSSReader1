//
//  CParser.m
//  FisrtStepRSS
//
//  Created by Admin on 25/10/2012.
//  Copyright (c) 2012 Vadim Glushko. All rights reserved.
//

#import "CParser.h"

@implementation CParser

@synthesize rssParser;
@synthesize responcedata;
@synthesize currentElement;
@synthesize parData;
@synthesize currentTitle;
@synthesize currentpubDate;
@synthesize currenturl;
@synthesize currentdescription;
@synthesize delegate;



-(id)initwithurl:(NSString *)TextURL;
{    parData = [[ParserData alloc] init];    
    responcedata = [[CDownloader alloc] initwithurl:TextURL];
    responcedata.delegate = self;
    return self;
}

-(void)start
{  
    rssParser = [[NSXMLParser alloc] initWithData:responcedata.rssData];    
    rssParser.delegate = self;    
    [rssParser parse];    
}

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict  {
    
    self.currentElement = elementName;
    if ([elementName isEqualToString:@"item"]) {
        currentTitle = [NSMutableString string];
        currentpubDate  = [NSMutableString string];
        currenturl = [NSMutableString string];
        currentdescription = [NSMutableString string];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];}
        else if ([currentElement isEqualToString:@"link"])
        {
            [currenturl appendString:string];
        }
    else if ([currentElement isEqualToString:@"description"])
    {
        [currentdescription appendString:string];
    }
	    else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentpubDate appendString:string];
    }
      
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        [parData.feedURL insertObject:currenturl atIndex:[parData.feedURL count]];
        [parData.feedTitle insertObject:currentTitle atIndex:[parData.feedTitle count]];
        [parData.feedPubDate insertObject:currentpubDate atIndex:[parData.feedPubDate count]];
        [parData.feedDescription insertObject:currentdescription atIndex:[parData.feedDescription count]];
        currentTitle = nil;
        currentpubDate = nil;
        currenturl = nil;
        currentdescription = nil;
        currentElement = nil;
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"%@", parseError);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    SEL selector = @selector(finishParser);
	if (delegate && [delegate respondsToSelector:selector]) {
		[delegate performSelector:selector];
	}
}

-(void)dealloc
{
    [rssParser release];
    [responcedata release];
    [currentElement release];
    [parData release];
    [currentTitle release];
    [currentpubDate release];
    [currenturl release];
    [delegate release];
    [super dealloc];
}

@end
