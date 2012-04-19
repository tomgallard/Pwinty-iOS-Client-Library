//
//  OrdersListCell.m
//  testPwinty
//
//  Created by Chinara Kuzekeeva on 3/29/12.
//  Copyright (c) 2012 Sibers. All rights reserved.
//

#import "OrdersListCell.h"

@implementation OrdersListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(OrdersData *)oData
{
    _oID.text = [NSString stringWithFormat:@"%d", oData.oID];
    recipientName.text = oData.recipientName;
    address1.text = oData.address1;
    if (oData.address2 == nil)
    {
        _address2.text = @"Empty";
    }
    else
    {
        _address2.text = oData.address2;
    }
    
    if (oData.addressTownOrCity == nil)
    {
        TownCity.text = @"Empty";
    }
    else
    {
        TownCity.text = oData.addressTownOrCity;
    }
    StateCountry.text = oData.stateOrCountry;
    postalZip.text = oData.postalOrZipCode;
    country.text = oData.country;
    status.text = oData.status;
    photosCount.text = [NSString stringWithFormat:@"%d", [oData.photos count]];
}

- (void)dealloc {
    [_oID release];
    [recipientName release];
    [address1 release];
    [_address2 release];
    [TownCity release];
    [StateCountry release];
    [postalZip release];
    [country release];
    [status release];
    [photosCount release];
    [super dealloc];
}
@end
