; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/Overrun_StringOperate_SrcBiggerThanDest_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/Overrun_StringOperate_SrcBiggerThanDest_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.TestBadCase01.src = private unnamed_addr constant [10 x i8] c"123456789\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBadCase01() #0 !dbg !9 {
entry:
  %src = alloca [10 x i8], align 1
  %dest = alloca [5 x i8], align 1
  %ret = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [10 x i8]* %src, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [10 x i8]* %src to i8*, !dbg !19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.TestBadCase01.src, i32 0, i32 0), i64 10, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata [5 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !24
  %1 = bitcast [5 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 0, i64 5, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !25, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %dest, i64 0, i64 0, !dbg !28
  %arraydecay1 = getelementptr inbounds [10 x i8], [10 x i8]* %src, i64 0, i64 0, !dbg !29
  %arraydecay2 = getelementptr inbounds [10 x i8], [10 x i8]* %src, i64 0, i64 0, !dbg !30
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !31
  %call3 = call i32 (i8*, i64, i8*, i64, ...) bitcast (i32 (...)* @strncpy_s to i32 (i8*, i64, i8*, i64, ...)*)(i8* noundef %arraydecay, i64 noundef 5, i8* noundef %arraydecay1, i64 noundef %call), !dbg !32
  store i32 %call3, i32* %ret, align 4, !dbg !27
  %2 = load i32, i32* %ret, align 4, !dbg !33
  %cmp = icmp ne i32 %2, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @strncpy_s(...) #4

declare i64 @strlen(i8* noundef) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/Overrun_StringOperate_SrcBiggerThanDest_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestBadCase01", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "safe/Overrun_StringOperate_SrcBiggerThanDest_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 6, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 6, column: 10, scope: !9)
!20 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 7, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 40, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 5)
!24 = !DILocation(line: 7, column: 10, scope: !9)
!25 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 9, type: !26)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DILocation(line: 9, column: 9, scope: !9)
!28 = !DILocation(line: 9, column: 25, scope: !9)
!29 = !DILocation(line: 9, column: 45, scope: !9)
!30 = !DILocation(line: 9, column: 57, scope: !9)
!31 = !DILocation(line: 9, column: 50, scope: !9)
!32 = !DILocation(line: 9, column: 15, scope: !9)
!33 = !DILocation(line: 10, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 9)
!35 = !DILocation(line: 10, column: 13, scope: !34)
!36 = !DILocation(line: 10, column: 9, scope: !9)
!37 = !DILocation(line: 11, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 10, column: 19)
!39 = !DILocation(line: 13, column: 1, scope: !9)
