; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_memcpy_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  br label %source, !dbg !22

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !23), !dbg !24
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !33
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !45
  %mul = mul i64 %call5, 1, !dbg !45
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay3, i8* noundef %5, i64 noundef %mul, i64 noundef 100) #9, !dbg !45
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx7, align 1, !dbg !47
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @printLine(i8* noundef %arraydecay8), !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* noundef %6), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_memcpy_18_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_18_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_18_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  br label %source, !dbg !79

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !80), !dbg !81
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %source
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !90
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx2, align 1, !dbg !98
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !99
  %mul = mul i64 %call5, 1, !dbg !99
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay3, i8* noundef %5, i64 noundef %mul, i64 noundef 100) #9, !dbg !99
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx7, align 1, !dbg !101
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  call void @printLine(i8* noundef %arraydecay8), !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* noundef %6), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 5, scope: !14)
!23 = !DILabel(scope: !14, name: "source", file: !15, line: 28)
!24 = !DILocation(line: 28, column: 1, scope: !14)
!25 = !DILocation(line: 30, column: 20, scope: !14)
!26 = !DILocation(line: 30, column: 10, scope: !14)
!27 = !DILocation(line: 31, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 9)
!29 = !DILocation(line: 31, column: 14, scope: !28)
!30 = !DILocation(line: 31, column: 9, scope: !14)
!31 = !DILocation(line: 31, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 23)
!33 = !DILocation(line: 32, column: 5, scope: !14)
!34 = !DILocation(line: 33, column: 5, scope: !14)
!35 = !DILocation(line: 33, column: 16, scope: !14)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !15, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocation(line: 36, column: 9, scope: !37)
!43 = !DILocation(line: 37, column: 9, scope: !37)
!44 = !DILocation(line: 37, column: 21, scope: !37)
!45 = !DILocation(line: 40, column: 9, scope: !37)
!46 = !DILocation(line: 41, column: 9, scope: !37)
!47 = !DILocation(line: 41, column: 21, scope: !37)
!48 = !DILocation(line: 42, column: 19, scope: !37)
!49 = !DILocation(line: 42, column: 9, scope: !37)
!50 = !DILocation(line: 43, column: 14, scope: !37)
!51 = !DILocation(line: 43, column: 9, scope: !37)
!52 = !DILocation(line: 45, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_18_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !57, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 91, type: !59)
!62 = !DILocation(line: 91, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 91, type: !60)
!64 = !DILocation(line: 91, column: 27, scope: !56)
!65 = !DILocation(line: 94, column: 22, scope: !56)
!66 = !DILocation(line: 94, column: 12, scope: !56)
!67 = !DILocation(line: 94, column: 5, scope: !56)
!68 = !DILocation(line: 96, column: 5, scope: !56)
!69 = !DILocation(line: 97, column: 5, scope: !56)
!70 = !DILocation(line: 98, column: 5, scope: !56)
!71 = !DILocation(line: 101, column: 5, scope: !56)
!72 = !DILocation(line: 102, column: 5, scope: !56)
!73 = !DILocation(line: 103, column: 5, scope: !56)
!74 = !DILocation(line: 105, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 54, type: !3)
!77 = !DILocation(line: 54, column: 12, scope: !75)
!78 = !DILocation(line: 55, column: 10, scope: !75)
!79 = !DILocation(line: 56, column: 5, scope: !75)
!80 = !DILabel(scope: !75, name: "source", file: !15, line: 57)
!81 = !DILocation(line: 57, column: 1, scope: !75)
!82 = !DILocation(line: 59, column: 20, scope: !75)
!83 = !DILocation(line: 59, column: 10, scope: !75)
!84 = !DILocation(line: 60, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !15, line: 60, column: 9)
!86 = !DILocation(line: 60, column: 14, scope: !85)
!87 = !DILocation(line: 60, column: 9, scope: !75)
!88 = !DILocation(line: 60, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 60, column: 23)
!90 = !DILocation(line: 61, column: 5, scope: !75)
!91 = !DILocation(line: 62, column: 5, scope: !75)
!92 = !DILocation(line: 62, column: 17, scope: !75)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !15, line: 64, type: !38)
!94 = distinct !DILexicalBlock(scope: !75, file: !15, line: 63, column: 5)
!95 = !DILocation(line: 64, column: 14, scope: !94)
!96 = !DILocation(line: 65, column: 9, scope: !94)
!97 = !DILocation(line: 66, column: 9, scope: !94)
!98 = !DILocation(line: 66, column: 21, scope: !94)
!99 = !DILocation(line: 69, column: 9, scope: !94)
!100 = !DILocation(line: 70, column: 9, scope: !94)
!101 = !DILocation(line: 70, column: 21, scope: !94)
!102 = !DILocation(line: 71, column: 19, scope: !94)
!103 = !DILocation(line: 71, column: 9, scope: !94)
!104 = !DILocation(line: 72, column: 14, scope: !94)
!105 = !DILocation(line: 72, column: 9, scope: !94)
!106 = !DILocation(line: 74, column: 1, scope: !75)
