; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !31

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !32
  %call3 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end4, !dbg !36

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !43
  %7 = load i8*, i8** %data, align 8, !dbg !43
  %call5 = call i64 @strlen(i8* noundef %7), !dbg !43
  %mul = mul i64 %call5, 1, !dbg !43
  %call6 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #9, !dbg !43
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx7, align 1, !dbg !45
  %8 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %8), !dbg !47
  %9 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* noundef %9), !dbg !49
  ret void, !dbg !50
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call1, 0, !dbg !89
  br i1 %tobool, label %if.then2, label %if.else, !dbg !91

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end4, !dbg !94

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !95
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !95
  %call3 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !102
  %7 = load i8*, i8** %data, align 8, !dbg !102
  %call5 = call i64 @strlen(i8* noundef %7), !dbg !102
  %mul = mul i64 %call5, 1, !dbg !102
  %call6 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #9, !dbg !102
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !103
  store i8 0, i8* %arrayidx7, align 1, !dbg !104
  %8 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* noundef %8), !dbg !106
  %9 = load i8*, i8** %data, align 8, !dbg !107
  call void @free(i8* noundef %9), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !110 {
entry:
  ret i32 0, !dbg !111
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !115
  store i8* %call, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call1, 0, !dbg !123
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !125

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !126
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !126
  %call3 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !126
  %4 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end4, !dbg !130

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !133
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !134
  %6 = load i8*, i8** %data, align 8, !dbg !134
  %7 = load i8*, i8** %data, align 8, !dbg !134
  %call5 = call i64 @strlen(i8* noundef %7), !dbg !134
  %mul = mul i64 %call5, 1, !dbg !134
  %call6 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef %mul, i64 noundef 50) #9, !dbg !134
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !135
  store i8 0, i8* %arrayidx7, align 1, !dbg !136
  %8 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* noundef %8), !dbg !138
  %9 = load i8*, i8** %data, align 8, !dbg !139
  call void @free(i8* noundef %9), !dbg !140
  ret void, !dbg !141
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !3)
!20 = !DILocation(line: 39, column: 12, scope: !14)
!21 = !DILocation(line: 40, column: 20, scope: !14)
!22 = !DILocation(line: 40, column: 10, scope: !14)
!23 = !DILocation(line: 41, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!25 = !DILocation(line: 41, column: 14, scope: !24)
!26 = !DILocation(line: 41, column: 9, scope: !14)
!27 = !DILocation(line: 41, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 41, column: 23)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !14)
!32 = !DILocation(line: 45, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !15, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 9, scope: !33)
!35 = !DILocation(line: 46, column: 21, scope: !33)
!36 = !DILocation(line: 47, column: 5, scope: !33)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 14, scope: !38)
!43 = !DILocation(line: 51, column: 9, scope: !38)
!44 = !DILocation(line: 52, column: 9, scope: !38)
!45 = !DILocation(line: 52, column: 20, scope: !38)
!46 = !DILocation(line: 53, column: 19, scope: !38)
!47 = !DILocation(line: 53, column: 9, scope: !38)
!48 = !DILocation(line: 54, column: 14, scope: !38)
!49 = !DILocation(line: 54, column: 9, scope: !38)
!50 = !DILocation(line: 56, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_08_good", scope: !15, file: !15, line: 111, type: !16, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!52 = !DILocation(line: 113, column: 5, scope: !51)
!53 = !DILocation(line: 114, column: 5, scope: !51)
!54 = !DILocation(line: 115, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 127, type: !56, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 127, type: !58)
!61 = !DILocation(line: 127, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 127, type: !59)
!63 = !DILocation(line: 127, column: 27, scope: !55)
!64 = !DILocation(line: 130, column: 22, scope: !55)
!65 = !DILocation(line: 130, column: 12, scope: !55)
!66 = !DILocation(line: 130, column: 5, scope: !55)
!67 = !DILocation(line: 132, column: 5, scope: !55)
!68 = !DILocation(line: 133, column: 5, scope: !55)
!69 = !DILocation(line: 134, column: 5, scope: !55)
!70 = !DILocation(line: 137, column: 5, scope: !55)
!71 = !DILocation(line: 138, column: 5, scope: !55)
!72 = !DILocation(line: 139, column: 5, scope: !55)
!73 = !DILocation(line: 141, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !75, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!75 = !DISubroutineType(types: !76)
!76 = !{!58}
!77 = !DILocation(line: 27, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 65, type: !3)
!80 = !DILocation(line: 65, column: 12, scope: !78)
!81 = !DILocation(line: 66, column: 20, scope: !78)
!82 = !DILocation(line: 66, column: 10, scope: !78)
!83 = !DILocation(line: 67, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !15, line: 67, column: 9)
!85 = !DILocation(line: 67, column: 14, scope: !84)
!86 = !DILocation(line: 67, column: 9, scope: !78)
!87 = !DILocation(line: 67, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 67, column: 23)
!89 = !DILocation(line: 68, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !15, line: 68, column: 8)
!91 = !DILocation(line: 68, column: 8, scope: !78)
!92 = !DILocation(line: 71, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 69, column: 5)
!94 = !DILocation(line: 72, column: 5, scope: !93)
!95 = !DILocation(line: 76, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !15, line: 74, column: 5)
!97 = !DILocation(line: 77, column: 9, scope: !96)
!98 = !DILocation(line: 77, column: 20, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !15, line: 80, type: !39)
!100 = distinct !DILexicalBlock(scope: !78, file: !15, line: 79, column: 5)
!101 = !DILocation(line: 80, column: 14, scope: !100)
!102 = !DILocation(line: 82, column: 9, scope: !100)
!103 = !DILocation(line: 83, column: 9, scope: !100)
!104 = !DILocation(line: 83, column: 20, scope: !100)
!105 = !DILocation(line: 84, column: 19, scope: !100)
!106 = !DILocation(line: 84, column: 9, scope: !100)
!107 = !DILocation(line: 85, column: 14, scope: !100)
!108 = !DILocation(line: 85, column: 9, scope: !100)
!109 = !DILocation(line: 87, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!111 = !DILocation(line: 32, column: 5, scope: !110)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!113 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 92, type: !3)
!114 = !DILocation(line: 92, column: 12, scope: !112)
!115 = !DILocation(line: 93, column: 20, scope: !112)
!116 = !DILocation(line: 93, column: 10, scope: !112)
!117 = !DILocation(line: 94, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !15, line: 94, column: 9)
!119 = !DILocation(line: 94, column: 14, scope: !118)
!120 = !DILocation(line: 94, column: 9, scope: !112)
!121 = !DILocation(line: 94, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 94, column: 23)
!123 = !DILocation(line: 95, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !15, line: 95, column: 8)
!125 = !DILocation(line: 95, column: 8, scope: !112)
!126 = !DILocation(line: 98, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 96, column: 5)
!128 = !DILocation(line: 99, column: 9, scope: !127)
!129 = !DILocation(line: 99, column: 20, scope: !127)
!130 = !DILocation(line: 100, column: 5, scope: !127)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !15, line: 102, type: !39)
!132 = distinct !DILexicalBlock(scope: !112, file: !15, line: 101, column: 5)
!133 = !DILocation(line: 102, column: 14, scope: !132)
!134 = !DILocation(line: 104, column: 9, scope: !132)
!135 = !DILocation(line: 105, column: 9, scope: !132)
!136 = !DILocation(line: 105, column: 20, scope: !132)
!137 = !DILocation(line: 106, column: 19, scope: !132)
!138 = !DILocation(line: 106, column: 9, scope: !132)
!139 = !DILocation(line: 107, column: 14, scope: !132)
!140 = !DILocation(line: 107, column: 9, scope: !132)
!141 = !DILocation(line: 109, column: 1, scope: !112)
