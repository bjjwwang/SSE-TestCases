; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/SelfdefinedSprintf_DestOverflow_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/SelfdefinedSprintf_DestOverflow_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @cwe120_c_30(i8* noundef %buf, i8* noundef %fmt) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %fmt.addr = alloca i8*, align 8
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* %fmt, i8** %fmt.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %fmt.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [1 x %struct.__va_list_tag]* %args, metadata !23, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %n, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i8*, i8** %buf.addr, align 8, !dbg !41
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !41
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !41
  %3 = load i8*, i8** %fmt.addr, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, !dbg !41
  %call = call i32 @__vsprintf_chk(i8* noundef %0, i32 noundef 0, i64 noundef %2, i8* noundef %3, %struct.__va_list_tag* noundef %arraydecay), !dbg !41
  store i32 %call, i32* %n, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i64 0, i64 0, !dbg !43
  %arraydecay12 = bitcast %struct.__va_list_tag* %arraydecay1 to i8*, !dbg !43
  call void @llvm.va_end(i8* %arraydecay12), !dbg !43
  %4 = load i32, i32* %n, align 4, !dbg !44
  ret i32 %4, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @__vsprintf_chk(i8* noundef, i32 noundef, i64 noundef, i8* noundef, %struct.__va_list_tag* noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca i8*, align 8
  %fmt = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i32, i32* %argc.addr, align 4, !dbg !54
  %cmp = icmp slt i32 %0, 2, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !58
  br label %return, !dbg !58

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %buf, metadata !60, metadata !DIExpression()), !dbg !61
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !62
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !62
  store i8* %2, i8** %buf, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata i8** %fmt, metadata !63, metadata !DIExpression()), !dbg !64
  %3 = load i8*, i8** %buf, align 8, !dbg !65
  %4 = load i8*, i8** %fmt, align 8, !dbg !66
  %call = call i32 @cwe120_c_30(i8* noundef %3, i8* noundef %4), !dbg !67
  store i32 0, i32* %retval, align 4, !dbg !68
  br label %return, !dbg !68

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %5, !dbg !69
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/SelfdefinedSprintf_DestOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_30", scope: !10, file: !10, line: 13, type: !11, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!10 = !DIFile(filename: "function/SelfdefinedSprintf_DestOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !16}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!18 = !{}
!19 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 13, type: !14)
!20 = !DILocation(line: 13, column: 23, scope: !9)
!21 = !DILocalVariable(name: "fmt", arg: 2, scope: !9, file: !10, line: 13, type: !16)
!22 = !DILocation(line: 13, column: 40, scope: !9)
!23 = !DILocalVariable(name: "args", scope: !9, file: !10, line: 15, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "va_list", file: !25, line: 14, baseType: !26)
!25 = !DIFile(filename: "/usr/local/Cellar/llvm/14.0.6/lib/clang/14.0.6/include/stdarg.h", directory: "")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !10, baseType: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 192, elements: !36)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, elements: !29)
!29 = !{!30, !32, !33, !35}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !28, file: !10, line: 15, baseType: !31, size: 32)
!31 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !28, file: !10, line: 15, baseType: !31, size: 32, offset: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !28, file: !10, line: 15, baseType: !34, size: 64, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !28, file: !10, line: 15, baseType: !34, size: 64, offset: 128)
!36 = !{!37}
!37 = !DISubrange(count: 1)
!38 = !DILocation(line: 15, column: 13, scope: !9)
!39 = !DILocalVariable(name: "n", scope: !9, file: !10, line: 16, type: !13)
!40 = !DILocation(line: 16, column: 9, scope: !9)
!41 = !DILocation(line: 19, column: 9, scope: !9)
!42 = !DILocation(line: 19, column: 7, scope: !9)
!43 = !DILocation(line: 20, column: 5, scope: !9)
!44 = !DILocation(line: 21, column: 12, scope: !9)
!45 = !DILocation(line: 21, column: 5, scope: !9)
!46 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 23, type: !47, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!47 = !DISubroutineType(types: !48)
!48 = !{!13, !13, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !10, line: 23, type: !13)
!51 = !DILocation(line: 23, column: 14, scope: !46)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !10, line: 23, type: !49)
!53 = !DILocation(line: 23, column: 26, scope: !46)
!54 = !DILocation(line: 25, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !10, line: 25, column: 9)
!56 = !DILocation(line: 25, column: 14, scope: !55)
!57 = !DILocation(line: 25, column: 9, scope: !46)
!58 = !DILocation(line: 26, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !10, line: 25, column: 19)
!60 = !DILocalVariable(name: "buf", scope: !46, file: !10, line: 28, type: !14)
!61 = !DILocation(line: 28, column: 12, scope: !46)
!62 = !DILocation(line: 28, column: 18, scope: !46)
!63 = !DILocalVariable(name: "fmt", scope: !46, file: !10, line: 29, type: !16)
!64 = !DILocation(line: 29, column: 17, scope: !46)
!65 = !DILocation(line: 30, column: 17, scope: !46)
!66 = !DILocation(line: 30, column: 22, scope: !46)
!67 = !DILocation(line: 30, column: 5, scope: !46)
!68 = !DILocation(line: 31, column: 5, scope: !46)
!69 = !DILocation(line: 32, column: 1, scope: !46)
