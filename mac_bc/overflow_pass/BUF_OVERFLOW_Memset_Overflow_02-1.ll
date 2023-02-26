; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memset_Overflow_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%2d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [100 x i32], align 16
  %num = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [100 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %num, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %num, align 4, !dbg !21
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32* noundef %num), !dbg !22
  %0 = load i32, i32* %num, align 4, !dbg !23
  %cmp = icmp sge i32 %0, 0, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %buffer, i64 0, i64 0, !dbg !27
  %1 = bitcast i32* %arraydecay to i8*, !dbg !27
  %2 = load i32, i32* %num, align 4, !dbg !27
  %conv = sext i32 %2 to i64, !dbg !27
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 97, i64 noundef %conv, i64 noundef 400) #4, !dbg !27
  br label %if.end, !dbg !29

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %buffer, i64 0, i64 0, !dbg !30
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !30
  %4 = load i32, i32* %num, align 4, !dbg !30
  %conv3 = sext i32 %4 to i64, !dbg !30
  %call4 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 97, i64 noundef %conv3, i64 noundef 400) #4, !dbg !30
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %5, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @scanf(i8* noundef, ...) #2

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memset_Overflow_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 3200, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 100)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocalVariable(name: "num", scope: !9, file: !10, line: 9, type: !13)
!21 = !DILocation(line: 9, column: 9, scope: !9)
!22 = !DILocation(line: 10, column: 5, scope: !9)
!23 = !DILocation(line: 12, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 9)
!25 = !DILocation(line: 12, column: 13, scope: !24)
!26 = !DILocation(line: 12, column: 9, scope: !9)
!27 = !DILocation(line: 13, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 12, column: 19)
!29 = !DILocation(line: 14, column: 5, scope: !28)
!30 = !DILocation(line: 16, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !10, line: 15, column: 10)
!32 = !DILocation(line: 18, column: 1, scope: !9)
