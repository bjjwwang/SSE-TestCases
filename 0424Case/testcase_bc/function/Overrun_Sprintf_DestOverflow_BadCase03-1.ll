; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Overrun_Sprintf_DestOverflow_BadCase03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Overrun_Sprintf_DestOverflow_BadCase03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.TestBadCase02.printStr = private unnamed_addr constant [27 x i8] c"Hello world, good morning!\00", align 16
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@__const.TestBadCase01.printStr = private unnamed_addr constant [27 x i8] c"Hello world, good morning!\00", align 16
@dest = external global [8 x i8], align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBadCase02() #0 !dbg !9 {
entry:
  %dest1 = alloca [8 x i8], align 1
  %printStr = alloca [27 x i8], align 16
  call void @llvm.dbg.declare(metadata [8 x i8]* %dest1, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [8 x i8]* %dest1 to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 8, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata [27 x i8]* %printStr, metadata !20, metadata !DIExpression()), !dbg !24
  %1 = bitcast [27 x i8]* %printStr to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 getelementptr inbounds ([27 x i8], [27 x i8]* @__const.TestBadCase02.printStr, i32 0, i32 0), i64 27, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %dest1, i64 0, i64 0, !dbg !25
  %arraydecay1 = getelementptr inbounds [27 x i8], [27 x i8]* %printStr, i64 0, i64 0, !dbg !25
  %call = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef %arraydecay, i32 noundef 0, i64 noundef 8, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay1), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__sprintf_chk(i8* noundef, i32 noundef, i64 noundef, i8* noundef, ...) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBadCase01() #0 !dbg !27 {
entry:
  %printStr = alloca [27 x i8], align 16
  call void @llvm.dbg.declare(metadata [27 x i8]* %printStr, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = bitcast [27 x i8]* %printStr to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 getelementptr inbounds ([27 x i8], [27 x i8]* @__const.TestBadCase01.printStr, i32 0, i32 0), i64 27, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [27 x i8], [27 x i8]* %printStr, i64 0, i64 0, !dbg !30
  %call = call i32 (i8*, i32, i64, i8*, ...) @__sprintf_chk(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @dest, i64 0, i64 0), i32 noundef 0, i64 noundef 8, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %arraydecay), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @TestBadCase01(), !dbg !36
  call void @TestBadCase02(), !dbg !37
  ret i32 0, !dbg !38
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Overrun_Sprintf_DestOverflow_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestBadCase02", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/Overrun_Sprintf_DestOverflow_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "dest1", scope: !9, file: !10, line: 16, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 64, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 8)
!19 = !DILocation(line: 16, column: 10, scope: !9)
!20 = !DILocalVariable(name: "printStr", scope: !9, file: !10, line: 17, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 216, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 27)
!24 = !DILocation(line: 17, column: 10, scope: !9)
!25 = !DILocation(line: 19, column: 5, scope: !9)
!26 = !DILocation(line: 20, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "TestBadCase01", scope: !10, file: !10, line: 27, type: !11, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!28 = !DILocalVariable(name: "printStr", scope: !27, file: !10, line: 29, type: !21)
!29 = !DILocation(line: 29, column: 10, scope: !27)
!30 = !DILocation(line: 31, column: 5, scope: !27)
!31 = !DILocation(line: 32, column: 1, scope: !27)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 33, type: !33, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!33 = !DISubroutineType(types: !34)
!34 = !{!35}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 35, column: 5, scope: !32)
!37 = !DILocation(line: 36, column: 5, scope: !32)
!38 = !DILocation(line: 37, column: 5, scope: !32)
