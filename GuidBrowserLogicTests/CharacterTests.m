//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by 晓川 on 12-10-31.
//  Copyright (c) 2012年 Charlie Fulton. All rights reserved.
//

#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"
@implementation CharacterTests
{
    NSDictionary *_characterDetailJson;
}

- (void)setUp{
    NSURL *dataServiecURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiecURL];
    
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData options:kNilOptions error:&error];
    STAssertNotNil(json, @"omvalid test data");
    
    _characterDetailJson = json;
    
    
    
}

- (void)tearDown{
    _characterDetailJson = nil;
}


- (void)testCreateCharacterFromDetailJson
{
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"Could not crate character from detail json");
    
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil Data");
    
    
}

// 1
-(void)testCreateCharacterFromDetailJsonProps
{
    Character *_testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    STAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    STAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    STAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    STAssertEqualObjects(_testGuy.achievementPoints, @3130, @"achievement points is wrong");
    STAssertEqualObjects(_testGuy.level,@85, @"level is wrong");
    
    STAssertEqualObjects(_testGuy.classType, @"Warrior", @"class type is wrong");
    STAssertEqualObjects(_testGuy.race, @"Human", @"race is wrong");
    STAssertEqualObjects(_testGuy.gender, @"Male", @"gener is wrong");
    STAssertEqualObjects(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    STAssertEqualObjects(_testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    Character *_testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];

    STAssertEqualObjects(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    STAssertEqualObjects(_testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    STAssertEqualObjects(_testGuy.waistItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    STAssertEqualObjects(_testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    STAssertEqualObjects(_testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    STAssertEqualObjects(_testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    STAssertEqualObjects(_testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    STAssertEqualObjects(_testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    STAssertEqualObjects(_testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    STAssertEqualObjects(_testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    STAssertEqualObjects(_testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.offHandItem.name,nil, @"offhand should be nil");
    STAssertEqualObjects(_testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    STAssertEqualObjects(_testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}
@end
