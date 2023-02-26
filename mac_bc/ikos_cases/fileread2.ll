; ModuleID = 'mac_bc/ikos_cases/fileread2.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %fptr = alloca %struct.__sFILE*, align 8
  %str = alloca [60 x i8], align 16
  %bitsRead = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %fptr, metadata !24, metadata !DIExpression()), !dbg !85
  %0 = load i8**, i8*** %argv.addr, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 0, !dbg !86
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !86
  %call = call %struct.__sFILE* @"\01_fopen"(i8* noundef %1, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)), !dbg !87
  store %struct.__sFILE* %call, %struct.__sFILE** %fptr, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [60 x i8]* %str, metadata !89, metadata !DIExpression()), !dbg !93
  %2 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !94
  %cmp = icmp eq %struct.__sFILE* %2, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  %3 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !98
  %cmp1 = icmp eq %struct.__sFILE* %3, null, !dbg !100
  %conv = zext i1 %cmp1 to i32, !dbg !100
  %call2 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef %conv), !dbg !101
  call void @exit(i32 noundef 1) #4, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %arraydecay = getelementptr inbounds [60 x i8], [60 x i8]* %str, i64 0, i64 0, !dbg !103
  %4 = load %struct.__sFILE*, %struct.__sFILE** %fptr, align 8, !dbg !105
  %call3 = call i8* @fgets(i8* noundef %arraydecay, i32 noundef 60, %struct.__sFILE* noundef %4), !dbg !106
  %cmp4 = icmp ne i8* %call3, null, !dbg !107
  br i1 %cmp4, label %if.then6, label %if.end9, !dbg !108

if.then6:                                         ; preds = %if.end
  %arraydecay7 = getelementptr inbounds [60 x i8], [60 x i8]* %str, i64 0, i64 0, !dbg !109
  %call8 = call i32 @puts(i8* noundef %arraydecay7), !dbg !111
  br label %if.end9, !dbg !112

if.end9:                                          ; preds = %if.then6, %if.end
  call void @llvm.dbg.declare(metadata i32* %bitsRead, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay10 = getelementptr inbounds [60 x i8], [60 x i8]* %str, i64 0, i64 0, !dbg !115
  %call11 = call i64 @strlen(i8* noundef %arraydecay10), !dbg !116
  %conv12 = trunc i64 %call11 to i32, !dbg !116
  store i32 %conv12, i32* %bitsRead, align 4, !dbg !114
  %5 = load i32, i32* %retval, align 4, !dbg !117
  ret i32 %5, !dbg !117
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #2

declare i32 @svf_assert(...) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i8* @fgets(i8* noundef, i32 noundef, %struct.__sFILE* noundef) #2

declare i32 @puts(i8* noundef) #2

declare i64 @strlen(i8* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 3, type: !13, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!12 = !DIFile(filename: "src/ikos_cases/fileread2.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{}
!20 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 3, type: !15)
!21 = !DILocation(line: 3, column: 14, scope: !11)
!22 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 3, type: !16)
!23 = !DILocation(line: 3, column: 27, scope: !11)
!24 = !DILocalVariable(name: "fptr", scope: !11, file: !12, line: 4, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !27, line: 157, baseType: !28)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !27, line: 126, size: 1216, elements: !29)
!29 = !{!30, !33, !34, !35, !37, !38, !43, !44, !45, !49, !53, !63, !69, !70, !73, !74, !78, !82, !83, !84}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !28, file: !27, line: 127, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !28, file: !27, line: 128, baseType: !15, size: 32, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !28, file: !27, line: 129, baseType: !15, size: 32, offset: 96)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !28, file: !27, line: 130, baseType: !36, size: 16, offset: 128)
!36 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !28, file: !27, line: 131, baseType: !36, size: 16, offset: 144)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !28, file: !27, line: 132, baseType: !39, size: 128, offset: 192)
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !27, line: 92, size: 128, elements: !40)
!40 = !{!41, !42}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !39, file: !27, line: 93, baseType: !31, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !39, file: !27, line: 94, baseType: !15, size: 32, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !28, file: !27, line: 133, baseType: !15, size: 32, offset: 320)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !28, file: !27, line: 136, baseType: !3, size: 64, offset: 384)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !28, file: !27, line: 137, baseType: !46, size: 64, offset: 448)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DISubroutineType(types: !48)
!48 = !{!15, !3}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !28, file: !27, line: 138, baseType: !50, size: 64, offset: 512)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DISubroutineType(types: !52)
!52 = !{!15, !3, !17, !15}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !28, file: !27, line: 139, baseType: !54, size: 64, offset: 576)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !3, !57, !15}
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !27, line: 81, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !59, line: 71, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !61, line: 48, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!62 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !28, file: !27, line: 140, baseType: !64, size: 64, offset: 640)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DISubroutineType(types: !66)
!66 = !{!15, !3, !67, !15}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !28, file: !27, line: 143, baseType: !39, size: 128, offset: 704)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !28, file: !27, line: 144, baseType: !71, size: 64, offset: 832)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !27, line: 98, flags: DIFlagFwdDecl)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !28, file: !27, line: 145, baseType: !15, size: 32, offset: 896)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !28, file: !27, line: 148, baseType: !75, size: 24, offset: 928)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 24, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 3)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !28, file: !27, line: 149, baseType: !79, size: 8, offset: 952)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 8, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 1)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !28, file: !27, line: 152, baseType: !39, size: 128, offset: 960)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !28, file: !27, line: 155, baseType: !15, size: 32, offset: 1088)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !28, file: !27, line: 156, baseType: !57, size: 64, offset: 1152)
!85 = !DILocation(line: 4, column: 11, scope: !11)
!86 = !DILocation(line: 5, column: 18, scope: !11)
!87 = !DILocation(line: 5, column: 12, scope: !11)
!88 = !DILocation(line: 5, column: 10, scope: !11)
!89 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 6, type: !90)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 60)
!93 = !DILocation(line: 6, column: 10, scope: !11)
!94 = !DILocation(line: 7, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !11, file: !12, line: 7, column: 8)
!96 = !DILocation(line: 7, column: 13, scope: !95)
!97 = !DILocation(line: 7, column: 8, scope: !11)
!98 = !DILocation(line: 9, column: 20, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 8, column: 5)
!100 = !DILocation(line: 9, column: 24, scope: !99)
!101 = !DILocation(line: 9, column: 9, scope: !99)
!102 = !DILocation(line: 10, column: 9, scope: !99)
!103 = !DILocation(line: 12, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !11, file: !12, line: 12, column: 9)
!105 = !DILocation(line: 12, column: 25, scope: !104)
!106 = !DILocation(line: 12, column: 9, scope: !104)
!107 = !DILocation(line: 12, column: 30, scope: !104)
!108 = !DILocation(line: 12, column: 9, scope: !11)
!109 = !DILocation(line: 14, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !12, line: 12, column: 39)
!111 = !DILocation(line: 14, column: 9, scope: !110)
!112 = !DILocation(line: 15, column: 5, scope: !110)
!113 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 16, type: !15)
!114 = !DILocation(line: 16, column: 9, scope: !11)
!115 = !DILocation(line: 16, column: 27, scope: !11)
!116 = !DILocation(line: 16, column: 20, scope: !11)
!117 = !DILocation(line: 19, column: 1, scope: !11)
