; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/SelfdefinedScanf_DestOverflow_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/SelfdefinedScanf_DestOverflow_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [3 x i8] c"ab\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @cwe120_c_24() #0 !dbg !9 {
entry:
  %ret = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %fmt = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %ret, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %args, metadata !17, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i8** %fmt, metadata !33, metadata !DIExpression()), !dbg !38
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8** %fmt, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, !dbg !39
  %call = call i32 @vscanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), %struct.__va_list_tag* noundef %arraydecay), !dbg !40
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, !dbg !41
  %arraydecay12 = bitcast %struct.__va_list_tag* %arraydecay1 to i8*, !dbg !41
  call void @llvm.va_end(i8* %arraydecay12), !dbg !41
  %0 = load i32, i32* %ret, align 4, !dbg !42
  ret i32 %0, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @vscanf(i8* noundef, %struct.__va_list_tag* noundef) #2

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @cwe120_c_24(), !dbg !45
  ret i32 0, !dbg !46
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/SelfdefinedScanf_DestOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_24", scope: !10, file: !10, line: 13, type: !11, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "function/SelfdefinedScanf_DestOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "ret", scope: !9, file: !10, line: 15, type: !13)
!16 = !DILocation(line: 15, column: 9, scope: !9)
!17 = !DILocalVariable(name: "args", scope: !9, file: !10, line: 16, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !19, line: 14, baseType: !20)
!19 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 192, elements: !30)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !23)
!23 = !{!24, !26, !27, !29}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !22, file: !10, line: 16, baseType: !25, size: 32)
!25 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !22, file: !10, line: 16, baseType: !25, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !22, file: !10, line: 16, baseType: !28, size: 64, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !22, file: !10, line: 16, baseType: !28, size: 64, offset: 128)
!30 = !{!31}
!31 = !DISubrange(count: 1)
!32 = !DILocation(line: 16, column: 13, scope: !9)
!33 = !DILocalVariable(name: "fmt", scope: !9, file: !10, line: 17, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocation(line: 17, column: 23, scope: !9)
!39 = !DILocation(line: 19, column: 17, scope: !9)
!40 = !DILocation(line: 19, column: 5, scope: !9)
!41 = !DILocation(line: 20, column: 5, scope: !9)
!42 = !DILocation(line: 21, column: 12, scope: !9)
!43 = !DILocation(line: 21, column: 5, scope: !9)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!45 = !DILocation(line: 25, column: 5, scope: !44)
!46 = !DILocation(line: 26, column: 5, scope: !44)
