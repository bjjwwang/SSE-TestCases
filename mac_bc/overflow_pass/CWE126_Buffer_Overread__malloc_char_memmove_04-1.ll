; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_memmove_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memmove_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_memmove_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !32
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !44
  %mul = mul i64 %call5, 1, !dbg !44
  %call6 = call i8* @__memmove_chk(i8* noundef %arraydecay3, i8* noundef %5, i64 noundef %mul, i64 noundef 100) #9, !dbg !44
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx7, align 1, !dbg !46
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @printLine(i8* noundef %arraydecay8), !dbg !48
  %6 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* noundef %6), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_memmove_04_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
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
  call void @CWE126_Buffer_Overread__malloc_char_memmove_04_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__malloc_char_memmove_04_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !89
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !89
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !98
  %mul = mul i64 %call5, 1, !dbg !98
  %call6 = call i8* @__memmove_chk(i8* noundef %arraydecay3, i8* noundef %5, i64 noundef %mul, i64 noundef 100) #9, !dbg !98
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx7, align 1, !dbg !100
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @printLine(i8* noundef %arraydecay8), !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* noundef %6), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !120
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !120
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx2, align 1, !dbg !128
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !129
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !129
  %mul = mul i64 %call5, 1, !dbg !129
  %call6 = call i8* @__memmove_chk(i8* noundef %arraydecay3, i8* noundef %5, i64 noundef %mul, i64 noundef 100) #9, !dbg !129
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx7, align 1, !dbg !131
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !132
  call void @printLine(i8* noundef %arraydecay8), !dbg !133
  %6 = load i8*, i8** %data, align 8, !dbg !134
  call void @free(i8* noundef %6), !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_04_bad", scope: !15, file: !15, line: 30, type: !16, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memmove_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 32, type: !3)
!20 = !DILocation(line: 32, column: 12, scope: !14)
!21 = !DILocation(line: 33, column: 10, scope: !14)
!22 = !DILocation(line: 37, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 35, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 8)
!25 = !DILocation(line: 37, column: 14, scope: !23)
!26 = !DILocation(line: 38, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 38, column: 13)
!28 = !DILocation(line: 38, column: 18, scope: !27)
!29 = !DILocation(line: 38, column: 13, scope: !23)
!30 = !DILocation(line: 38, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 38, column: 27)
!32 = !DILocation(line: 39, column: 9, scope: !23)
!33 = !DILocation(line: 40, column: 9, scope: !23)
!34 = !DILocation(line: 40, column: 20, scope: !23)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !15, line: 43, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 43, column: 14, scope: !36)
!41 = !DILocation(line: 44, column: 9, scope: !36)
!42 = !DILocation(line: 45, column: 9, scope: !36)
!43 = !DILocation(line: 45, column: 21, scope: !36)
!44 = !DILocation(line: 48, column: 9, scope: !36)
!45 = !DILocation(line: 49, column: 9, scope: !36)
!46 = !DILocation(line: 49, column: 21, scope: !36)
!47 = !DILocation(line: 50, column: 19, scope: !36)
!48 = !DILocation(line: 50, column: 9, scope: !36)
!49 = !DILocation(line: 51, column: 14, scope: !36)
!50 = !DILocation(line: 51, column: 9, scope: !36)
!51 = !DILocation(line: 53, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memmove_04_good", scope: !15, file: !15, line: 116, type: !16, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!53 = !DILocation(line: 118, column: 5, scope: !52)
!54 = !DILocation(line: 119, column: 5, scope: !52)
!55 = !DILocation(line: 120, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !57, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 132, type: !59)
!62 = !DILocation(line: 132, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 132, type: !60)
!64 = !DILocation(line: 132, column: 27, scope: !56)
!65 = !DILocation(line: 135, column: 22, scope: !56)
!66 = !DILocation(line: 135, column: 12, scope: !56)
!67 = !DILocation(line: 135, column: 5, scope: !56)
!68 = !DILocation(line: 137, column: 5, scope: !56)
!69 = !DILocation(line: 138, column: 5, scope: !56)
!70 = !DILocation(line: 139, column: 5, scope: !56)
!71 = !DILocation(line: 142, column: 5, scope: !56)
!72 = !DILocation(line: 143, column: 5, scope: !56)
!73 = !DILocation(line: 144, column: 5, scope: !56)
!74 = !DILocation(line: 146, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 62, type: !3)
!77 = !DILocation(line: 62, column: 12, scope: !75)
!78 = !DILocation(line: 63, column: 10, scope: !75)
!79 = !DILocation(line: 72, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !15, line: 70, column: 5)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 64, column: 8)
!82 = !DILocation(line: 72, column: 14, scope: !80)
!83 = !DILocation(line: 73, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 73, column: 13)
!85 = !DILocation(line: 73, column: 18, scope: !84)
!86 = !DILocation(line: 73, column: 13, scope: !80)
!87 = !DILocation(line: 73, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 73, column: 27)
!89 = !DILocation(line: 74, column: 9, scope: !80)
!90 = !DILocation(line: 75, column: 9, scope: !80)
!91 = !DILocation(line: 75, column: 21, scope: !80)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !15, line: 78, type: !37)
!93 = distinct !DILexicalBlock(scope: !75, file: !15, line: 77, column: 5)
!94 = !DILocation(line: 78, column: 14, scope: !93)
!95 = !DILocation(line: 79, column: 9, scope: !93)
!96 = !DILocation(line: 80, column: 9, scope: !93)
!97 = !DILocation(line: 80, column: 21, scope: !93)
!98 = !DILocation(line: 83, column: 9, scope: !93)
!99 = !DILocation(line: 84, column: 9, scope: !93)
!100 = !DILocation(line: 84, column: 21, scope: !93)
!101 = !DILocation(line: 85, column: 19, scope: !93)
!102 = !DILocation(line: 85, column: 9, scope: !93)
!103 = !DILocation(line: 86, column: 14, scope: !93)
!104 = !DILocation(line: 86, column: 9, scope: !93)
!105 = !DILocation(line: 88, column: 1, scope: !75)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !16, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!107 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 93, type: !3)
!108 = !DILocation(line: 93, column: 12, scope: !106)
!109 = !DILocation(line: 94, column: 10, scope: !106)
!110 = !DILocation(line: 98, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !15, line: 96, column: 5)
!112 = distinct !DILexicalBlock(scope: !106, file: !15, line: 95, column: 8)
!113 = !DILocation(line: 98, column: 14, scope: !111)
!114 = !DILocation(line: 99, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 99, column: 13)
!116 = !DILocation(line: 99, column: 18, scope: !115)
!117 = !DILocation(line: 99, column: 13, scope: !111)
!118 = !DILocation(line: 99, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 99, column: 27)
!120 = !DILocation(line: 100, column: 9, scope: !111)
!121 = !DILocation(line: 101, column: 9, scope: !111)
!122 = !DILocation(line: 101, column: 21, scope: !111)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 104, type: !37)
!124 = distinct !DILexicalBlock(scope: !106, file: !15, line: 103, column: 5)
!125 = !DILocation(line: 104, column: 14, scope: !124)
!126 = !DILocation(line: 105, column: 9, scope: !124)
!127 = !DILocation(line: 106, column: 9, scope: !124)
!128 = !DILocation(line: 106, column: 21, scope: !124)
!129 = !DILocation(line: 109, column: 9, scope: !124)
!130 = !DILocation(line: 110, column: 9, scope: !124)
!131 = !DILocation(line: 110, column: 21, scope: !124)
!132 = !DILocation(line: 111, column: 19, scope: !124)
!133 = !DILocation(line: 111, column: 9, scope: !124)
!134 = !DILocation(line: 112, column: 14, scope: !124)
!135 = !DILocation(line: 112, column: 9, scope: !124)
!136 = !DILocation(line: 114, column: 1, scope: !106)
