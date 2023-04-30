; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/Buffer_Size_Warning_Array_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Buffer_Size_Warning_Array_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [10 x i8] c"abcdefghi\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @BadCase01(i8* noundef %argv) #0 !dbg !9 {
entry:
  %argv.addr = alloca i8*, align 8
  %testName = alloca [10 x i8], align 1
  store i8* %argv, i8** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [10 x i8]* %testName, metadata !18, metadata !DIExpression()), !dbg !22
  %0 = bitcast [10 x i8]* %testName to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !22
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %testName, i64 0, i64 0, !dbg !23
  %1 = load i8*, i8** %argv.addr, align 8, !dbg !23
  %call = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef 10, i64 noundef 10) #4, !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !25 {
entry:
  %argv = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %argv, metadata !29, metadata !DIExpression()), !dbg !30
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8** %argv, align 8, !dbg !30
  %0 = load i8*, i8** %argv, align 8, !dbg !31
  call void @BadCase01(i8* noundef %0), !dbg !32
  ret i32 0, !dbg !33
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/Buffer_Size_Warning_Array_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "BadCase01", scope: !10, file: !10, line: 18, type: !11, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "function/Buffer_Size_Warning_Array_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !{}
!16 = !DILocalVariable(name: "argv", arg: 1, scope: !9, file: !10, line: 18, type: !13)
!17 = !DILocation(line: 18, column: 22, scope: !9)
!18 = !DILocalVariable(name: "testName", scope: !9, file: !10, line: 20, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 80, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 20, column: 10, scope: !9)
!23 = !DILocation(line: 23, column: 5, scope: !9)
!24 = !DILocation(line: 24, column: 1, scope: !9)
!25 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 26, type: !26, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!26 = !DISubroutineType(types: !27)
!27 = !{!28}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocalVariable(name: "argv", scope: !25, file: !10, line: 27, type: !13)
!30 = !DILocation(line: 27, column: 11, scope: !25)
!31 = !DILocation(line: 28, column: 15, scope: !25)
!32 = !DILocation(line: 28, column: 5, scope: !25)
!33 = !DILocation(line: 29, column: 1, scope: !25)
