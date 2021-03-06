/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

#import "ContextMenuHandlers.h"
#import "MenuManager.h"

@implementation NSObject (ContextMenuHandlers)

+ (void)ContextMenuHandlers_addViewSpecificStuffToMenu:(id)arg1 browserViewController:(id)arg2 context:(unsigned int)arg3
{
	[self ContextMenuHandlers_addViewSpecificStuffToMenu:arg1 browserViewController:arg2 context:arg3];

	MenuManager* menuManager = [MenuManager sharedInstance];

	if (menuManager.menuItems.count > 0)
	{
		[menuManager addItemsToMenu:arg1 forFiles:menuManager.menuItems];
		[menuManager.menuItems removeAllObjects];
	}
}

+ (void)ContextMenuHandlers_handleContextMenuCommon:(unsigned int)arg1 nodes:(const struct TFENodeVector*)arg2 event:(id)arg3 view:(id)arg4 browserController:(id)arg5 addPlugIns:(BOOL)arg6  // Mountain Lion
{
	MenuManager* menuManager = [MenuManager sharedInstance];

	menuManager.menuItems = (NSMutableArray*)[menuManager pathsForNodes:arg2];

	[self ContextMenuHandlers_handleContextMenuCommon:arg1 nodes:arg2 event:arg3 view:arg4 browserController:arg5 addPlugIns:arg6];
}

+ (void)ContextMenuHandlers_handleContextMenuCommon:(unsigned int)arg1 nodes:(const struct TFENodeVector*)arg2 event:(id)arg3 view:(id)arg4 windowController:(id)arg5 addPlugIns:(BOOL)arg6   // Lion
{
	MenuManager* menuManager = [MenuManager sharedInstance];

	menuManager.menuItems = (NSMutableArray*)[menuManager pathsForNodes:arg2];

	[self ContextMenuHandlers_handleContextMenuCommon:arg1 nodes:arg2 event:arg3 view:arg4 windowController:arg5 addPlugIns:arg6];
}

- (void)ContextMenuHandlers_configureWithNodes:(const struct TFENodeVector*)arg1 browserController:(id)arg2 container:(BOOL)arg3  // Mountain Lion
{
	[self ContextMenuHandlers_configureWithNodes:arg1 browserController:arg2 container:arg3];

	TContextMenu* realSelf = (TContextMenu*)self;
	MenuManager* menuManager = [MenuManager sharedInstance];

	NSArray* selectedItems = [menuManager pathsForNodes:arg1];
	[menuManager addItemsToMenu:realSelf forFiles:selectedItems];
}

- (void)ContextMenuHandlers_configureWithNodes:(const struct TFENodeVector*)arg1 windowController:(id)arg2 container:(BOOL)arg3   // Lion
{
	[self ContextMenuHandlers_configureWithNodes:arg1 windowController:arg2 container:arg3];

	TContextMenu* realSelf = (TContextMenu*)self;
	MenuManager* menuManager = [MenuManager sharedInstance];

	NSArray* selectedItems = [menuManager pathsForNodes:arg1];
	[menuManager addItemsToMenu:realSelf forFiles:selectedItems];
}

@end