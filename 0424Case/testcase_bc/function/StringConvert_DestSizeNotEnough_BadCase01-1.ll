; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/StringConvert_DestSizeNotEnough_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/StringConvert_DestSizeNotEnough_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_1() #0 !dbg !9 {
entry:
  %num = alloca i32, align 4
  %ch = alloca [5 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %num, metadata !14, metadata !DIExpression()), !dbg !16
  store i32 123456789, i32* %num, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata [5 x i8]* %ch, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [5 x i8]* %ch to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 5, i1 false), !dbg !22
  %1 = load i32, i32* %num, align 4, !dbg !23
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %ch, i64 0, i64 0, !dbg !24
  %call = call i32 (i32, i8*, i32, ...) bitcast (i32 (...)* @itoa to i32 (i32, i8*, i32, ...)*)(i32 noundef %1, i8* noundef %arraydecay, i32 noundef 10), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @itoa(...) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @test_bad_1(), !dbg !30
  ret i32 0, !dbg !31
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/StringConvert_DestSizeNotEnough_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "test_bad_1", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/StringConvert_DestSizeNotEnough_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "num", scope: !9, file: !10, line: 10, type: !15)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocation(line: 10, column: 9, scope: !9)
!17 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 11, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 40, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 5)
!22 = !DILocation(line: 11, column: 10, scope: !9)
!23 = !DILocation(line: 13, column: 10, scope: !9)
!24 = !DILocation(line: 13, column: 15, scope: !9)
!25 = !DILocation(line: 13, column: 5, scope: !9)
!26 = !DILocation(line: 14, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !28, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!28 = !DISubroutineType(types: !29)
!29 = !{!15}
!30 = !DILocation(line: 19, column: 5, scope: !27)
!31 = !DILocation(line: 20, column: 5, scope: !27)
