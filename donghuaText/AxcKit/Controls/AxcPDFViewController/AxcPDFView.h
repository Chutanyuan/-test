//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AxcPDFView : UIView{
    CGPDFDocumentRef pdfRef; // pdf文件
    CGPDFPageRef pdfPage;    // pdf页面
}
@property (assign, nonatomic) NSUInteger pageIndex; // 页面号

- (id)initWithPDFRef:(CGPDFDocumentRef)pdfr andLastPage:(NSInteger)lastPage;

- (void)reloadView;

@end
